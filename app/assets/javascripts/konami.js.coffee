Konami = ->
  konami =
    addEvent: (obj, type, fn, ref_obj) ->
      if obj.addEventListener
        obj.addEventListener type, fn, false
      else if obj.attachEvent
        # IE
        obj["e" + type + fn] = fn
        obj[type + fn] = ->
          obj["e" + type + fn] window.event, ref_obj

        obj.attachEvent "on#{type}", obj[type + fn]

    input: ""
    pattern: "38384040373937396665"

    load: (link) ->
      @addEvent document, "keydown", ((e, ref_obj) ->
        # IE
        konami = ref_obj if ref_obj

        konami.input += if e then e.keyCode else event.keyCode

        if konami.input.length > konami.pattern.length
          konami.input =
            konami.input.substr(konami.input.length - konami.pattern.length)

        if konami.input == konami.pattern
          konami.code link
          konami.input = ""
          return
      ), this
      @iphone.load link

    code: (link) ->
      window.location = link

    iphone:
      start_x: 0
      start_y: 0
      stop_x: 0
      stop_y: 0

      tap: false
      capture: false

      orig_keys: ""
      keys: [
        "UP", "UP",
        "DOWN", "DOWN",
        "LEFT", "RIGHT",
        "LEFT", "RIGHT",
        "TAP", "TAP", "TAP"
      ]

      code: (link) ->
        konami.code link

      load: (link) ->
        @orig_keys = @keys

        konami.addEvent document, "touchmove", (e) ->
          if e.touches.length == 1 and konami.iphone.capture
            touch = e.touches[0]
            konami.iphone.stop_x = touch.pageX
            konami.iphone.stop_y = touch.pageY
            konami.iphone.tap = konami.iphone.capture = false
            konami.iphone.check_direction()

        konami.addEvent document, "touchend", ((evt) ->
          konami.iphone.check_direction link if konami.iphone.tap
        ), false

        konami.addEvent document, "touchstart", (evt) ->
          konami.iphone.start_x = evt.changedTouches[0].pageX
          konami.iphone.start_y = evt.changedTouches[0].pageY
          konami.iphone.tap = konami.iphone.capture = true

      check_direction: (link) ->
        x_magnitude = Math.abs(@start_x - @stop_x)
        y_magnitude = Math.abs(@start_y - @stop_y)

        x = @start_x - if @stop_x < 0 then "RIGHT" else "LEFT"
        y = @start_y - if @stop_y < 0 then "DOWN" else "UP"

        result = if x_magnitude > y_magnitude then x \
                 else if @tap then "TAP" else y

        @keys = @keys.slice(1, @keys.length) if result == @keys[0]
        if @keys.length == 0
          @keys = @orig_keys
          @code link

  konami

konami = new Konami
konami.code = ->
  $("#alma-mater").modal()
konami.load()
