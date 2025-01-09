escape_keyevent = hs.eventtap.new (
  {hs.eventtap.event.types.keyDown},
  function (event)
    local flags = event:getFlags()
    local keycode = hs.keycodes.map[event:getKeyCode()]

    if (keycode == 'escape') then
      -- print("This is escape")
      local input_korean = "com.apple.inputmethod.Korean.2SetKorean"
      local input_english = "com.apple.keylayout.UnicodeHexInput"

      local input_source = hs.keycodes.currentSourceID()

      if (input_source ~= input_english) then
        hs.keycodes.currentSourceID(input_english)
      end
    end
  end
)
escape_keyevent:start()

function stroke_arrow(arrow_key)
  local event = require("hs.eventtap").event
  event.newKeyEvent({}, arrow_key, true):post()
  event.newKeyEvent({}, arrow_key, false):post()
end

hs.hotkey.bind({"ctrl"}, "H",
  function () stroke_arrow('left') end,
  function () end,
  function () stroke_arrow('left') end
)
hs.hotkey.bind({"ctrl"}, "J",
  function () stroke_arrow('down') end,
  function () end,
  function () stroke_arrow('down') end
)
hs.hotkey.bind({"ctrl"}, "K",
  function () stroke_arrow('up') end,
  function () end,
  function () stroke_arrow('up') end
)
hs.hotkey.bind({"ctrl"}, "L",
  function () stroke_arrow('right') end,
  function () end,
  function () stroke_arrow('right') end
)

hs.hotkey.bind({"option"}, "H",
  function () stroke_arrow('left') end,
  function () end,
  function () stroke_arrow('left') end
)
hs.hotkey.bind({"option"}, "J",
  function () stroke_arrow('down') end,
  function () end,
  function () stroke_arrow('down') end
)
hs.hotkey.bind({"option"}, "K",
  function () stroke_arrow('up') end,
  function () end,
  function () stroke_arrow('up') end
)
hs.hotkey.bind({"option"}, "L",
  function () stroke_arrow('right') end,
  function () end,
  function () stroke_arrow('right') end
)
