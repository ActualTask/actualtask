$ ->
  if $('.pagination').length && $('#tasks').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text('Загрузка заданий...')
        $.getScript(url)
    $(window).scroll