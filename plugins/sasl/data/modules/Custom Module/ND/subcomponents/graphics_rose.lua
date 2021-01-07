local image_bkg_ring        = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/ring.png")
local image_bkg_ring_red    = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/ring-red.png")
local image_bkg_ring_tcas   = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/tcas-ring.png")
local image_bkg_ring_arrows = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/ring-arrows.png")
local image_bkg_ring_middle = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/ring-middle.png")

local image_point_apt = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/point-apt.png")

local image_vor_1 = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/needle-VOR1.png")
local image_vor_2 = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/needle-VOR2.png")
local image_adf   = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/needle-ADF1.png")

local image_track_sym = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/sym-track-ring.png")
local image_hdgsel_sym = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/sym-hdgsel-ring.png")

local image_ils_sym = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/sym-ils-ring.png")
local image_ils_nonprec_sym = sasl.gl.loadImage(moduleDirectory .. "/Custom Module/textures/ND/sym-ils-nonprec-ring.png")
    

size = {900, 900}

local COLOR_YELLOW = {1,1,0}

local function draw_backgrounds(data)
    -- Main rose background
    if data.inputs.is_heading_valid then
        sasl.gl.drawRotatedTexture(image_bkg_ring, -data.inputs.heading, (size[1]-750)/2,(size[2]-750)/2,750,750)

        if data.misc.tcas_ta_triggered or data.misc.tcas_ra_triggered or data.config.range == ND_RANGE_10 then

            -- Inner (TCAS) circle is activated only when:
            -- - Range is 10, or
            -- - TCAS RA or TA activates
            sasl.gl.drawRotatedTexture(image_bkg_ring_tcas, -data.inputs.heading, (size[1]-750)/2,(size[2]-750)/2,750,750)
        end
    else
        -- Heading not available
        sasl.gl.drawTexture(image_bkg_ring_red, (size[1]-591)/2,(size[2]-590)/2,591,590)
    end
    
end

local function draw_fixed_symbols(data)

    if not data.inputs.is_heading_valid then
        return
    end

    -- Plane
    sasl.gl.drawWideLine(410, 450, 490, 450, 4, COLOR_YELLOW)
    sasl.gl.drawWideLine(450, 400, 450, 475, 4, COLOR_YELLOW)
    sasl.gl.drawWideLine(435, 415, 465, 415, 4, COLOR_YELLOW)

    -- Top heading indicator (yellow)
    sasl.gl.drawWideLine(450, 720, 450, 770, 5, COLOR_YELLOW)

    sasl.gl.drawTexture(image_bkg_ring_arrows, (size[1]-750)/2,(size[2]-750)/2,750,750)
    sasl.gl.drawTexture(image_bkg_ring_middle, (size[1]-750)/2,(size[2]-750)/2,750,750)
    
end

local function draw_ranges(data)
    -- Ranges
    if data.config.range > 0 then
        local ext_range = math.floor(2^(data.config.range-1) * 10)
        local int_range = math.floor(ext_range / 2)
        sasl.gl.drawText(Font_AirbusDUL, 250, 250, ext_range, 20, false, false, TEXT_ALIGN_LEFT, ECAM_BLUE)
        sasl.gl.drawText(Font_AirbusDUL, 350, 350, int_range, 20, false, false, TEXT_ALIGN_LEFT, ECAM_BLUE)
    end

end

local function draw_track_symbol(data)
    if not data.inputs.is_track_valid then
        return
    end

    sasl.gl.drawRotatedTexture(image_track_sym, (data.inputs.track-data.inputs.heading), (size[1]-17)/2,(size[2]-594)/2,17,594)
    
end

local function draw_hdgsel_symbol(data)

    if not data.inputs.hdg_sel_visible then
        return
    end
    
    sasl.gl.drawRotatedTexture(image_hdgsel_sym, (data.inputs.hdg_sel-data.inputs.heading), (size[1]-32)/2,(size[2]-641)/2,32,641)
end

local function draw_ls_symbol(data)

    if not data.inputs.ls_is_visible then
        return
    end
    
    sasl.gl.drawRotatedTexture(data.inputs.ls_is_precise and image_ils_sym or image_ils_nonprec_sym,
                              (data.inputs.ls_direction-data.inputs.heading+180), (size[1]-19)/2,(size[2]-657)/2,19,657)
end


local function draw_navaid_pointer_single(data, id)
    if not data.nav[id].needle_visible then
        return
    end

    local image = data.nav[id].selector == ND_SEL_ADF and image_adf or (id == 1 and image_vor_1 or image_vor_2)

    sasl.gl.drawRotatedTexture(image, 180+data.nav[id].needle_angle, (size[1]-42)/2,(size[2]-586)/2,42,586)

end

local function draw_navaid_pointers(data)
    draw_navaid_pointer_single(data, 1)
    draw_navaid_pointer_single(data, 2)
end

local function get_distance_nm(lat1,lon1,lat2,lon2)
    return GC_distance_km(lat1, lon1, lat2, lon2) * 0.539957
end

local function get_bearing(lat1,lon1,lat2,lon2)
    local lat1_rad = math.rad(lat1)
    local lat2_rad = math.rad(lat2)
    local lon1_rad = math.rad(lon1)
    local lon2_rad = math.rad(lon2)

    local x = math.sin(lon2_rad - lon1_rad) * math.cos(lat2_rad)
    local y = math.cos(lat1_rad) * math.sin(lat2_rad) - math.sin(lat1_rad)*math.cos(lat2_rad)*math.cos(lon2_rad - lon1_rad)
    local theta = math.atan2(y, x)
    local brng = (theta * 180 / math.pi + 360) % 360

    return brng
end

local function draw_poi_array(data, poi, texture, color)
    
    -- 588 px is the diameter of our ring, so this corresponds to the range scale selected:
    local range_in_nm = math.floor(2^(data.config.range-1) * 10)
    -- The the per_px nm is:
    local px_per_nm = 588 / range_in_nm

    local distance = get_distance_nm(data.inputs.plane_coords_lat,data.inputs.plane_coords_lon,poi.lat,poi.lon)
    local bearing  = get_bearing(data.inputs.plane_coords_lat,data.inputs.plane_coords_lon,poi.lat,poi.lon)
    
    local distance_px = distance * px_per_nm

    local x = size[1]/2 + distance_px * math.cos(math.rad(bearing+data.inputs.heading))
    local y = size[1]/2 + distance_px * math.sin(math.rad(bearing+data.inputs.heading))

    if x > 0 and x < size[1] and y > 0 and y < size[2] then
        sasl.gl.drawTexture(texture, x-16, y-16, 32,32)
        sasl.gl.drawText(Font_AirbusDUL, x+25, y-5, poi.id, 24, false, false, TEXT_ALIGN_LEFT, color)        
    end
end

local function draw_airports(data)
    if not data.config.extra_data ~= ND_DATA_ARPT then
        return  -- Airport button not selected
    end
    
    -- For each airtport visible...
    for i,airport in ipairs(data.poi.arpt) do
    
        draw_poi_array(data, airport, image_point_apt, ECAM_MAGENTA)

    end
    
end

function draw_rose_unmasked(data)
    draw_backgrounds(data)
    draw_fixed_symbols(data)
    draw_track_symbol(data)
    draw_hdgsel_symbol(data)
    draw_ls_symbol(data)
    draw_ranges(data)
end

function draw_rose(data)

    draw_airports(data) 
    draw_navaid_pointers(data)

end

