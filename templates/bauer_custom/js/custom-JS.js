document.addEventListener('DOMContentLoaded', function() {
    var headerSearch = document.querySelector('header #search-header');
    if (headerSearch) {
      headerSearch.placeholder = "Suche: Milwaukee / Ast,Nr / EAN (z.B 4923... / M18...)";
    }
  });


/*****************************************************************************************/

$(document).ready(function(){
  $(".owl-carousel").owlCarousel({
      loop: true,              
      margin: 15,            
      nav: false,        
      dots: true,         
      autoplay: true,      
      autoplayTimeout: 3000,   
      responsive:{
          0:{ items:1 },
          420:{ items:2 },
          600:{ items:3 },
          800:{ items:4 },
          1010:{ items:5 },
          1300:{ items:6 }
      }
  });
});


/********************************************************************/
document.addEventListener("DOMContentLoaded", function() {
    var btnPrivate = document.getElementById('wa-pb-private');
    var btnB2B     = document.getElementById('wa-pb-b2b');
    var slpxSwitch = document.getElementById('slpx-switch-1');

    if(slpxSwitch) {
        // Private button click
        if(btnPrivate) {
            btnPrivate.addEventListener('click', function() {
                if(slpxSwitch.checked) {
                    slpxSwitch.click(); // Uncheck
                }
                // Optional: update button classes
                btnPrivate.classList.add('private-active');
                btnB2B.classList.remove('b2b-active');
            });
        }

        // B2B button click
        if(btnB2B) {
            btnB2B.addEventListener('click', function() {
                if(!slpxSwitch.checked) {
                    slpxSwitch.click(); // Check
                }
                // Optional: update button classes
                btnB2B.classList.add('b2b-active');
                btnPrivate.classList.remove('private-active');
            });
        }
    }
});