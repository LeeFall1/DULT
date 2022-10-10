local fps = 20
local urls = {    
    {"assets.prod.novaquark.com/65967/4f244c42-cd20-4134-8eda-f971a887fd05.jpg", 12, 17},
    {"assets.prod.novaquark.com/65967/7c16f7d0-da00-4267-adb4-1e21c798a3d9.jpg", 10, 20},
    {"assets.prod.novaquark.com/65967/4b72f186-a52c-4d9d-a43a-7a0bd66b9dc9.jpg", 12, 17},
    {"assets.prod.novaquark.com/65967/868eb815-9e30-40d8-8434-969225468f55.jpg", 12, 17},
    {"assets.prod.novaquark.com/65967/d75b87ac-8707-497e-97dd-7b7edce981a7.jpg", 10, 20},
    {"assets.prod.novaquark.com/65967/7001cdd1-89be-4dbb-a937-57d860abc417.jpg", 11, 19},
    {"assets.prod.novaquark.com/65967/fd29b69e-018e-470b-896c-59b1753a7de0.jpg", 12, 16},
    {"assets.prod.novaquark.com/65967/298b2fc5-a304-42f8-be87-c621c72401f8.jpg", 12, 17},
    {"assets.prod.novaquark.com/65967/e5af3cf4-60d5-40ba-9218-d8c2d8dbccd4.jpg", 12, 17},
    {"assets.prod.novaquark.com/65967/70bd7edc-1c75-4ddd-ba0e-5c94622a84ee.jpg", 12, 16},
    {"assets.prod.novaquark.com/65967/f2efa848-4ef6-4190-a765-fe730673f91b.jpg", 10, 21},
    {"assets.prod.novaquark.com/65967/3318cc5c-e35f-451c-97a4-7daacd6342f8.jpg", 10, 19},
    {"assets.prod.novaquark.com/65967/68c9a1de-ec9e-40f1-9f6f-71dd5de13eb6.jpg", 10, 21},
    {"assets.prod.novaquark.com/65967/52f8e0c6-cfea-4c8c-96b6-bf66fe170b0d.jpg", 10, 19},
    {"assets.prod.novaquark.com/65967/4e271752-3fa8-4ad3-abdf-26ca7e057f5d.jpg", 12, 17},
  }
if not frameBuffer then
    frameBuffer = {}
    for k, v in ipairs(urls) do
        for r = 0, v[3]-1, 1 do
            for c = 0, v[2]-1, 1 do
                frameBuffer[#frameBuffer + 1] = {k,c,r}
            end
        end
    end
    totalFrames = #frameBuffer
end
local frames = frameBuffer

local rx, ry = getResolution()
local l = createLayer()

local frame = (math.floor(getTime() * fps) % totalFrames) + 1

local i = loadImage(urls[frames[frame][1]][1])
local i2 = loadImage(urls[((frames[frame][1] % #urls) + 1)][1])

local w, h = getImageSize(i)
local sx, sy = w / urls[frames[frame][1]][2], h / urls[frames[frame][1]][3]
logMessage(frames[frame][1].." / "..frames[frame][2].." / "..frames[frame][3])
addImageSub(l, i, 0, 0, rx, ry, frames[frame][2] * sx, frames[frame][3] * sy, sx, sy)

requestAnimationFrame(1)
