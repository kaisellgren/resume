(function() {
  var block = window.document.querySelector('.profile-inner-block')
  var topY = block.offsetTop

  var hasClass = false
  window.addEventListener('scroll', function (e) {
    if (window.scrollY > topY) {
      if (!hasClass) {
        hasClass = true
        block.className = block.className + ' profile-inner-block-fixed'
      }
    } else {
      hasClass = false
      block.className = block.className.replace('profile-inner-block-fixed', '')
    }
  })

  document.body.className = document.body.className.replace('initial', '')
}())