/*seegenmadical js*/

/*slide*/

// //메인 슬라이드 배너 수정본

// function bannerset(bn,dir){
//     if(dir=='right'){
//         var variable_width = $(".panel").width();
//         $('.slide .dot li.on').removeClass('on');
//         $('.slide .dot li:eq('+bn+')').addClass('on');
//         $('.slide .panel li:eq('+bn+')').show();
//         $('.slide .panel li:eq('+bn+')').css('left',variable_width+"px");
//         $('.slide .panel li.on').animate({'left': "-"+variable_width+"px"},1000,function(){
//             $(this).hide();
//             $(this).removeClass('on')
//         })
//         $('.slide .panel li:eq('+bn+')').animate({'left':'0'},1000,function(){
//             $(this).addClass('on')
//         })
//     }else{
//         var variable_width = $(".panel").width();
//         $('.slide .dot li.on').removeClass('on');
//         $('.slide .dot li:eq('+bn+')').addClass('on');
//         $('.slide .panel li:eq('+bn+')').show();
//         $('.slide .panel li:eq('+bn+')').css('left',"-"+variable_width+"px");
//         $('.slide .panel li.on').animate({'left':variable_width+"px"},1000,function(){
//             $(this).hide();
//             $(this).removeClass('on')
//         })
//         $('.slide .panel li:eq('+bn+')').animate({'left':'0'},1000,function(){
//             $(this).addClass('on')
//         })
//     }
// }
//
// $(document).ready(function(){
//     $('.slide .panel li:gt(0)').hide();
//     //동그라미 버튼 클릭했을 때
//     $('.slide .dot li').on('click',function(e){
//         e.preventDefault();
//         if($('.slide .panel li.on').is(':animated')==false){
//             var num = $(this).index();
//             var currentNum = $('.slide .dot li.on').index();
//             if(num > currentNum){
//                 bannerset(num,'right')
//             }else if(num < currentNum){
//                 bannerset(num,'left')
//             }
//         }
//     })
//     //이전버튼
//     $('.arrow_area .prev1').on('click',function(e){
//         e.preventDefault();
//         if($('.slide .panel li.on').is(':animated')==false){
//             var currentNum = $('.slide .dot li.on').index();
//             var num = currentNum-1;
//             if(num<0){
//                 num = $('.dot li').length-1;
//             }
//             bannerset(num,'left')
//         }
//     })
//     //다음버튼
//     $('.arrow_area .next1').on('click',function(e){
//         e.preventDefault();
//         if($('.slide .panel li.on').is(':animated')==false){
//             var currentNum = $('.slide .dot li.on').index();
//             var num = currentNum+1;
//             if(num>$('.dot li').length-1){
//                 num = 0;
//             }
//             bannerset(num,'right')
//         }
//     })
//
//     //이미지 호버시 자동슬라이드 멈춤
//     $('.slide').on('mouseenter',function(){
//         clearInterval(st);
//     })
//     //호버 안했을 때 다시 시작
//     $('.slide').on('mouseleave',function(){
//         setInterval(st);
//         st=setInterval(trigger,5000)
//     })
//     var st;
//
//     function trigger(){
//         $('.arrow_area .next1').triggerHandler('click');
//     }
//     st = setInterval(trigger,5000)
// })

/*stock 효과*/

// $(document).ready(function(){
//   function tick(){
//     $("#stock_01 li:first").animate(function(){$(this).appendTo($("#stock_01")).animate({left:"30px"});
//     });
//   }
//   setInterval(function(){tick ()}, 5000);
// });
//


/*rolling 효과*/

$(document).ready(function(){
	//스크린 사이즈에 따른 줌 처리
	var sw = screen.width;

	if(sw <= 800){
		document.body.style.zoom = 0.55;
		//ie는 추가 처리
		var agent = navigator.userAgent.toLowerCase();
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
			if($("#fixed_gnb").length > 0){
				document.getElementById('fixed_gnb').style.zoom = 0.55;
			}
		}
	}else if(sw <= 1024){
		document.body.style.zoom = 0.75;
		//ie는 추가 처리
		var agent = navigator.userAgent.toLowerCase();
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
			if($("#fixed_gnb").length > 0){
				document.getElementById('fixed_gnb').style.zoom = 0.75;
			}
		}
	}
//	$( window ).resize(function() {
//
//		location.reload();
//	});
//
//	$(window).on('resize', function() {
//		this.location.href = this.location.href;
//	});

	var slide=$('ul.rolling_ef');
	var slideWidth=slide.width();
	var slideList=$('ul.rolling_ef>li');
	var slideListWidth=$('ul.rolling_ef>li').width()+slideWidth*0.02;
	var current=0;
	var setInterval01;

	var btnList=$('ul.btn>li');


	mainSlide();
	function mainSlide(){
		setInterval01=setInterval(function(){
			slide.stop().animate({left:-slideListWidth},500, function(){
				$('ul.rolling_ef>li:first').insertAfter('ul.rolling_ef>li:last');
				slide.css('left',0);
			});

			btnList.removeClass('bg_black');
			current++;
			if(current == btnList.size()){current=0};
			btnList.eq(current).addClass('bg_black');
		},4000)
	}

	function next(){
		slide.animate({left:-slideListWidth},100, function(){
			$('ul.rolling_ef>li:first').insertAfter('ul.rolling_ef>li:last');
			slide.css('left',0);
		});

	}

	function prev(){
		$('ul.rolling_ef>li:last').insertBefore('ul.rolling_ef>li:first');
		slide.css('left',-slideListWidth);
		slide.animate({left:0},100);

	}

	$('.prev').click(function(){
		prev();
	})

	$('.next').click(function(){
		next();
	})

	$('.rolling_ef, .btn, .prev, .next').hover(function(){
		clearInterval(setInterval01);
	}, function(){
		mainSlide();
	})

	btnList.click(function(){
		var th=$(this);
		var i=th.index();
		var bgBlack=$('ul.btn>li.bg_black');
		var bgBlacki=bgBlack.index();
		var slideListi=slideList.eq(i);
		var Ltt=$('ul.rolling_ef>li:eq(0)').nextUntil(slideListi);


	})
});

/*tab menu*/

$(document).ready(function(){

    $('.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    if(tab_id){
    
	    $('.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
    }
  })

});

$(document).ready(function(){

    $('.chaps li').click(function(){
    var chap_id = $(this).attr('data-tab');

    $('.chaps li').removeClass('surrent');
    $('.chap-content').removeClass('surrent');

    $(this).addClass('surrent');
    $("#"+chap_id).addClass('surrent');
  })

});

// $(function(){
//   var t = 0;
//   $("#sub_title .central_tab2").hide()
//   $(".tab-2_central").click(function(){
//     if(t==0){
//       $('#sub_title .central_tab').hide();
//       t = 1;
//     }else{
//       $('#sub_title .central_tab2').show();
//       t = 0;
//     }
//   })
// });

// floating 메뉴

    $(function(){
      var t = 0;
      var $duration = 300;
      $(window).scroll(function(){
        if($(window).scrollTop() >= 100){
          if(t==0){
            $('#hide_menu').stop().addClass('sticky');
            $('#hide_menu').stop().animate({top:'250px',opacity:1},$duration)
            t = 1;
          }
        }else{
          if(t==1){
            // $('#hide_menu').stop().removeClass('sticky');
            $('#hide_menu').stop().animate({top:'275px',opacity:1},$duration)
            t = 0;
          }
        }
      })
    });

    /*sub page floating 메뉴*/

    $(function(){
      var t = 0;
      var $duration = 300;
      $(window).scroll(function(){
        if($(window).scrollTop() >= 100){
          if(t==0){
            $('#hide_menu2').stop().addClass('sticky');
            $('#hide_menu2').stop().animate({top:'240px',opacity:1},$duration)
            t = 1;
          }
        }else{
          if(t==1){
            // $('#hide_menu2').stop().removeClass('sticky');
            $('#hide_menu2').stop().animate({top:'455px',opacity:1},$duration)
            t = 0;
          }
        }
      })
    });

    $(function(){
      var t = 0;
      var $duration = 300;
      $(window).scroll(function(){
        if($(window).scrollTop() >= 100){
          if(t==0){
            $('#top_bt').stop().addClass('sticky');
//            $('#top_bt').stop().animate({top:'575px',opacity:1},$duration) // 영문버튼있을땐 620px
            $('#top_bt').stop().animate({top:'675px',opacity:1},$duration) // 영문버튼있을땐 620px
            t = 1;
          }
        }else{
          if(t==1){
            // $('#top_bt').stop().removeClass('sticky');
            $('#top_bt').stop().animate({top:'890px',opacity:1},$duration) // 영문버튼있을땐 885px
            t = 0;
          }
        }
      })
    });
    
    $(function(){
        var t = 0;
        var $duration = 300;
        $(window).scroll(function(){
          if($(window).scrollTop() >= 100){
            if(t==0){
              $('#top_bt2').stop().addClass('sticky');
//              $('#top_bt').stop().animate({top:'575px',opacity:1},$duration) // 영문버튼있을땐 620px
              $('#top_bt2').stop().animate({top:'450px',opacity:1},$duration) // 영문버튼있을땐 620px
              t = 1;
            }
          }else{
            if(t==1){
              // $('#top_bt').stop().removeClass('sticky');
              $('#top_bt2').stop().animate({top:'665px',opacity:1},$duration) // 영문버튼있을땐 885px
              t = 0;
            }
          }
        })
      });

    /*sub page floating 메뉴 짧은페이지*/

    $(function(){
      var t = 0;
      var $duration = 300;
      $(window).scroll(function(){
        if($(window).scrollTop() >= 100){
          if(t==0){
            $('#hide_menu3').stop().addClass('sticky');
            $('#hide_menu3').stop().animate({top:'240px',opacity:1},$duration)
            t = 1;
          }
        }else{
          if(t==1){
            // $('#hide_menu3').stop().removeClass('sticky');
            $('#hide_menu3').stop().animate({top:'505px',opacity:1},$duration)
            t = 0;
          }
        }
      })
    });

    /*top버튼*/


    /*top버튼 기능*/

    $(function(){
      // $(window).scroll(function(){
      //     if($(window).scrollTop()>210){
      //       $("#top_bt").fadeIn("fast");
      //     }else{
      //       $("#top_bt").fadeOut("fast");
      //     }
      // });
      $("#top_bt , #top_bt2 , .test_text").on({
        click : function(){
            $("html,body").stop().animate({scrollTop:0},500);
            return false;
        }
      });
    });

    /*sub page floating 메뉴 짧은페이지*/

    // $(function(){
    //   var login = 0;
    //   var $duration = 300;
    //   $(window).scroll(function(){
    //     if($(window).scrollTop() >= 50){
    //       if(login==0){
    //         $("#login_box").fadeIn(300);
    //       }
    //     }else{
    //       if(login==1){
    //         $("#login_box").fadeOut(300);
    //         login = 0;
    //       }
    //     }
    //   })
    // });

/*fixed 헤더고정*/

//     var vi = 10;  // 하단에 메뉴 표시할 스크롤 위치값 지정
//     var si = 1000;
//
//     $(window).scroll(function(){
//
//     var num = $(window).scrollTop();
//
//   if(num < vi){
//       $("#fixed_gnb").css("visibility","hidden").fadeOut(400);
//     }else if( num >= vi && num <= si){
//         $("#fixed_gnb").css("visibility","visible").fadeIn(400);
//     }
// });

    // // 헤더 액티브.each
    //
    //     $(function(){
    //       $(window).scroll(function(){
    //         $('.box').each(function(index){ // .each문 각 객체마다 속성부여기능
    //           if($(window).scrollTop() >= $('.box').eq(index).offset().top-200){
    //             $('.h_header li a').removeClass('on');
    //             $('.h_header li a').eq(index).addClass('on');
    //           }
    //         })
    //       })
    //     });

        // fixed 서브메뉴

            $(function(){
              var t = 0;
              $('.arrow2 , .arrow4').hide();
              $(window).scroll(function(){
                if($(window).scrollTop() >= 225){
                  if(t==0){  // if문 기초적인것
                    $('#container .sub_menu').stop().addClass('sticky');
                    $('.arrow').hide()
                    $('.arrow2 , .arrow4').show()
                     // 스크롤 내리면 .h_header 속성에 sticky 클래스 추가
                    t = 1;
                  }
                }else{
                  if(t==1){
                    $('#container .sub_menu').stop().removeClass('sticky');
                    $('.arrow').show()
                    $('.arrow2 , .arrow4').hide()
                    t = 0;
                  }
                }
              })
            });

  /*sub menu color change*/

$(document).ready(function(){
  setTimeout(function(){
      $(function(){
        $('.aaa_area > .small_sub03_01 , .aa_area > ul > li:nth-child(1) > a').mouseenter(function(){
          $('.aa_area > ul > li:nth-child(1) > a').css({"text-decoration":"underline"});
        })
      });
    }, 200);
  });

  $(document).ready(function(){
    setTimeout(function(){
      $(function(){
        $('.aaa_area > .small_sub03_01 , .aa_area > ul > li:nth-child(1) > a').mouseleave(function(){
          $('.aa_area > ul > li:nth-child(1) > a').css({"text-decoration":"none"});
        })
      });
    }, 200);
  });

  $(document).ready(function(){
    setTimeout(function(){
      $(function(){
        $('.aaa_area > .small_sub03_02 , .aa_area > ul > li:nth-child(2) > a').mouseenter(function(){
          $('.aa_area > ul > li:nth-child(2) > a').css({"text-decoration":"underline"});
        })
      });
    }, 200);
  });

  $(document).ready(function(){
    setTimeout(function(){
      $(function(){
        $('.aaa_area > .small_sub03_02 , .aa_area > ul > li:nth-child(2) > a').mouseleave(function(){
          $('.aa_area > ul > li:nth-child(2) > a').css({"text-decoration":"none"});
        })
      });
    }, 200);
  });

  $(document).ready(function(){
    setTimeout(function(){
      $(function(){
        $('.aaa_area > .small_sub03_03 , .aa_area > ul > li:nth-child(4) > a').mouseenter(function(){
          $('.aa_area > ul > li:nth-child(4) > a').css({"text-decoration":"underline"});
        })
      });
    }, 200);
  });

  $(document).ready(function(){
    setTimeout(function(){
      $(function(){
        $('.aaa_area > .small_sub03_03 , .aa_area > ul > li:nth-child(4) > a').mouseleave(function(){
          $('.aa_area > ul > li:nth-child(4) > a').css({"text-decoration":"none"});
        })
      });
    }, 200);
  });


//-------------------------------------------------------------------------------------------//

$(document).ready(function(){
  setTimeout(function(){
    $(function(){
      $('.bbb_area , .bb_area > ul > li:nth-child(2) > a').mouseenter(function(){
        $('.bb_area > ul > li:nth-child(2) > a').css({"text-decoration":"underline"});
      })
    });
  }, 200);
});

$(document).ready(function(){
  setTimeout(function(){
    $(function(){
      $('.bbb_area, .bb_area > ul > li:nth-child(2) > a').mouseleave(function(){
        $('.bb_area > ul > li:nth-child(2) > a').css({"text-decoration":"none"});
      })
    });
  }, 200);
});

//-------------------------------------------------------------------------------------------//

$(document).ready(function(){
  setTimeout(function(){
    $(function(){
      $('.ccc_area > .small_sub03_01 , .cc_area > ul > li:nth-child(4) > a').mouseenter(function(){
        $('.cc_area > ul > li:nth-child(4) > a').css({"text-decoration":"underline"});
      })
    });
  }, 200);
});


$(document).ready(function(){
  setTimeout(function(){
    $(function(){
      $('.ccc_area > .small_sub03_01 , .cc_area > ul > li:nth-child(4) > a').mouseleave(function(){
        $('.cc_area > ul > li:nth-child(4) > a').css({"text-decoration":"none"});
      })
    });
  }, 200);
});

//-------------------------------------------------------------------------------------------//

$(document).ready(function(){
   setTimeout(function(){
    $(function(){
      $('.ddd_area > .small_sub03_01 , .dd_area > ul > li:nth-child(2) > a').mouseenter(function(){
        $('.dd_area > ul > li:nth-child(2) > a').css({"text-decoration":"underline"});
      })
    });
  }, 200);
});

$(document).ready(function(){
   setTimeout(function(){
    $(function(){
      $('.ddd_area > .small_sub03_01 , .dd_area > ul > li:nth-child(2) > a').mouseleave(function(){
        $('.dd_area > ul > li:nth-child(2) > a').css({"text-decoration":"none"});
      })
    });
  }, 200);
});

  /*hover시 sub메뉴 사라짐*/
//최대리님이 알려준 setTimeuout *매우중요
//setTimeout 반대로 clearTimeout 이 있음
//setTimeout은 몇초뒤 이벤트실행 , clearTimeout은 몇초뒤 이벤트 중지

// $(document).ready(function(){
//   setTimeout(function(){
//     $(function(){
//       $('header nav ul > li').not('.not_gnb').mouseover(function(){
//           $('#login_box').stop().fadeOut(200);
//             $('header nav ul').mouseleave(function(){
//               $('#login_box').fadeIn(200);
//         });
//       });
//     });
//
//   }, 200);
// });

	// function menuHoverEvent(){
	//   $('header nav ul > li').not('.not_gnb').mouseover(function(){
	//       $('#login_box').stop().fadeOut(200);
	//         $('header nav ul > li').mouseleave(function(){
	//           $('#login_box').fadeIn(200);
	//     });
	//   });
	// }


  /*slide swiper*/

  $(function(){
    var swiper = new Swiper( '.swiper-container', {

      effect : 'fade', // 페이드 효과 사용 '기본값은 slide 다른옵션 cube, fade, overflow가 있음'
      spaceBetween: 30,
      centeredSlides: true,
      speed: 1000,
      loop : true, // 무한 반복
      pagination : { // 페이징 설정
        el : '.swiper-pagination',
        clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
      },
      navigation : { // 네비게이션 설정
        nextEl : '.swiper-button-next', // 다음 버튼 클래스명
        prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
      },

      autoplay : { // 자동 재생
      delay : 5500, // 딜레이 0
      disableOnInteraction: false, // 슬라이드 오버시 멈춤,자동재생
    }
  });

  // $('.swiper-container').on('mouseleave', function(){
  //   swiper.autoplay.start();
  //   return false;
  // })
  // $('.swiper-container').on('mouseenter', function(){
  //   swiper.autoplay.stop();
  //   return false;
  // })
});

/*php말고 html로 include하는 방법*/

//function includeHTML(callback) {
//  var z, i, elmnt, file, xhr;
//  /*loop through a collection of all HTML elements:*/
//  z = document.getElementsByTagName("*");
//  for (i = 0; i < z.length; i++) {
//    elmnt = z[i];
//    /*search for elements with a certain atrribute:*/
//    file = elmnt.getAttribute("include-html");
//    //console.log(file);
//    if (file) {
//      /*make an HTTP request using the attribute value as the file name:*/
//      xhr = new XMLHttpRequest();
//      xhr.onreadystatechange = function() {
//        if (this.readyState == 4) {
//          if (this.status == 200) {
//            elmnt.innerHTML = this.responseText;
//          }
//          if (this.status == 404) {
//            elmnt.innerHTML = "Page not found.";
//          }
//          /*remove the attribute, and call this function once more:*/
//          elmnt.removeAttribute("include-html");
//          includeHTML(callback);
//        }
//      };
//      xhr.open("GET", file, true);
//      xhr.send();
//      /*exit the function:*/
//      return;
//    }
//  }
//  setTimeout(function() {
//    if(callback){
//      callback();
//    }
//    // callback();
//  }, 0);
//};

$(document).ready(function(){
	menuHoverEvent();
	
//	includeHTML(menuHoverEvent);
});


// 윤리지침 아코디언메뉴

$(function(){
  $('.answer').hide();
  var acodian = {
    click : function(target) {
      var $target = $(target);
      $target.on('click',function() {
        if($(this).hasClass('on')){
          slideUp($target);
        }else{
          slideUp($target);
          $(this).addClass('on').next().slideDown();
        }
        function slideUp($target) {
          $target.removeClass('on').next().slideUp();
        }
      });
    }
  };
  acodian.click('.more_story');
});



/*faq toggle*/

//$(function(){
//    var article = (".recruit .show");
//    $(".recruit .title td a").click(function() {
//        var myArticle =$(this).parents().next("tr");
//        if($(myArticle).hasClass('hide')) {
//            $(article).removeClass('show').addClass('hide');
//            $(myArticle).removeClass('hide').addClass('show');
//        }
//        else {
//            $(myArticle).addClass('hide').removeClass('show');
//        }
//    });
//});


// /*one_click 페이지 전체보기*/
//
// $(function(){
//   var t = 0;
//   setTimeout(function(){
//   if(t==0){
//     $('.one_more_ico , .one_more_inner').click(function(){
//         $('.one_more_inner').stop().css({'display':'block'});
//         $('.one_more_plus').stop().css({'border-radius' : '10px 0 0 0'});
//       });
//       t = 1;
//   }else{
//     $('.one_more_ico , .one_more_inner').click(function(){
//         $('.one_more_inner').stop().css({'display':'none'});
//         $('.one_more_plus').stop().css({'border-radius' : '10px 0 10px 0'});
//       });
//       t = 0;
//   }
//
//
//   // $('.one_more_ico , .one_more_inner').mouseleav(function(){
//   //
//   //     $('.one_more_inner').stop().css({'display':'none'});
//   //     $('.one_more_plus').stop().css({'border-radius' : '10px 0 10px 0'});
//   // });
//   }, 200);
// });

/*one_click 플러스*/

$(function(){
  var t = 0;
  $('.one_more_plus').click(function(){
    if(t==0){
      $('.one_more_inner').fadeIn(300);
//      $('.one_more_plus').css({'border-radius' : '20px 0 0 0'});
      $('.one_more_plus').css({'border-radius' : '15px 0 0 0'});
      $('.one_more_plus a img').attr('src','/user/img/minus.png');
      t = 1;
    }else{
      $('.one_more_inner').fadeOut(300);
//      $('.one_more_plus').css({'border-radius' : '20px 0 20px 0'});
      $('.one_more_plus').css({'border-radius' : '15px 0 15px 0'});
            $('.one_more_plus a img').attr('src','/user/img/plus2.png');
      t = 0;
    }
  })
});

/*one_click정보 더보기버튼*/

//$(function(){
//  $('.oc_ul02').hide()
//    $('.one_click_more_view').click(function(){
//      $(this).hide();
//      $('.oc_ul02').show();
//  })
//})

/*학술제작물*/

$(function(){
      $(".book_ul > li , .book_ul > li > strong").mouseover(function(){
        $(this).find('strong').stop().animate({bottom:'-20px'},300);

      })

      .mouseleave(function(){
        $(this).find('strong').stop().animate({bottom:'-80px'},300);
      })
    //   .mouseout(function(){
    //     $(this).find('strong').stop().animate({bottom:'-150px',opacity:1},$duration);
    // });
});


/*popup*/

/*의료진현황 팝업*/ /*검사의뢰서 팝업*/

$(function(){
  $('#modal').hide();
    $('.popup_bt').click(function(){
      $('#modal').stop().fadeIn(300);
        $('#modal > .popup_bg , .close_bt').click(function(){
          $('#modal').fadeOut(300);
        })
    });
})

/*scroll animation*/

    /*각 페이지 animation effect*/

    // $(function(){
    //     var $duration = 1000;
    //   $('.banner_bg h1').stop().animate({opacity:1,'top':'0'},$duration);
    // });


/*central_lab bg*/

$(function(){
  $('.tab-2_central').click(function(){
      $('.gray_bg2').css({"display":"block"});
    })
  });

$(function(){
    $('.tab-1_central').click(function(){
        $('.gray_bg2').css({"display":"none"});
    })
});


/*각 페이지 fadeIn*/

    // $(function(){
    //     var $duration = 1500;
    //   $('#container .sub_story .right_box').stop().animate({opacity:1,'margin-top':'150px'},$duration);
    // });

    $(function(){
      $('#container #sub_title p').stop().animate({"opacity":1,"top":0},700);
      $('.banner_box h1').stop().animate({"opacity":1,"top":0},800);
      // $('#container .sub_menu ul').stop().animate({"opacity":1,"top":0},1200);
      // $('#container .sub_menu ul > li > ul').stop().animate({"opacity":1,"top":"47px"},1200);
      $('.sub_story').stop().animate({"opacity":1,"top":0},900);
      $('.chayong_bg_area , .chayong_bg_gray ').stop().animate({"opacity":1},2000);
//      $('.vision_bg_area').stop().animate({"opacity":1,"top":"45%"},1000);
//      $('.vision_bg_gray').stop().animate({"opacity":1,"top":"45%"},1000);
//      $('.vision_bg_area').stop().animate({"opacity":1,"top":"1317px"},1000);
//      $('.vision_bg_gray').stop().animate({"opacity":1,"top":"1317px"},1000);
    })


window.onload = function() {

    setTimeout (function () {

    $('.banner_bg').css({"transform":"scale(1) rotate(0deg)"});
  },50);

}

// window.onload = function() {
//
//     setTimeout (function () {
//
//     $('.banner_bg').css({"transform":"scale(1) rotate(0deg)" , "filter": "brightness(120%)"});
//   },50);
//
// }

// scroll시 animation


/*setTiomeout 오브젝트 중요★★★★★*/
//스크롤영역 닿으면 몇초뒤 오프젝트  생성

// $(function(){
//   var t = 0;
//   $(window).scroll(function(){
//     setTimeout(function(){
//       if($(window).scrollTop() > 250){
//         if(t==0){  // if문 기초적인것
//           $('.sub_p').stop().animate({"opacity":1},1200)
//           $('.ani_bg01').stop().animate({"opacity":1},1500);
//           t = 1;
//         }
//       }
//     },5000);
//
//   })
// });

//        /*01_sub01_A*/
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 250){
//              if(t==0){  // if문 기초적인것
//                $('.sub_p').stop().animate({"opacity":1},1200)
//                $('.ani_bg01').stop().animate({"opacity":1},1500);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 300){
//              if(t==0){  // if문 기초적인것
//                $('.sub_span').stop().animate({"opacity":1},1300);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 550){
//              if(t==0){  // if문 기초적인것
//                $('.dl01').stop().animate({"opacity":1,"bottom":0},500);
//                $('.dl02').stop().animate({"opacity":1,"bottom":0},800);
//                $('.dl03').stop().animate({"opacity":1,"bottom":0},1200);
//                $('.dl04').stop().animate({"opacity":1,"bottom":0},1500);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 700){
//              if(t==0){  // if문 기초적인것
//                $('.sub_ani00').stop().animate({"opacity":1,"bottom":0},1100);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        /*01_sub03*/
//
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 280){
//              if(t==0){  // if문 기초적인것
//                $('.sub_ani09').stop().animate({"opacity":1,"bottom":0},1000);
//                t = 1;
//              }
//            }
//          })
//        });
        //
        // $(function(){
        //   $('.clinical_tab01, .clinical_tab02 , .dl05, .dl06, .dl07, .dl08').hide();
        //   $('.tab-2_central').click(function(){
        //     $('.clinical_tab01, .clinical_tab02 , .dl05, .dl06, .dl07, .dl08').css({"display":"none"});
        //   })
        // })
        //
        // $(function(){
        //   var t = 0;
        //   $(window).scroll(function(){
        //     if($(window).scrollTop() > 650){
        //       if(t==0){  // if문 기초적인것
        //         $('.dl05').stop().animate({"opacity":1,"bottom":0},500);
        //         $('.dl06').stop().animate({"opacity":1,"bottom":0},800);
        //         $('.dl07').stop().animate({"opacity":1,"bottom":0},1200);
        //         $('.dl08').stop().animate({"opacity":1,"bottom":0},1500);
        //         t = 1;
        //       }
        //     }
        //   })
        // });

//        /*01_sub04_A*/
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 250){
//              if(t==0){  // if문 기초적인것
//                $('.sub_ani01').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 550){
//              if(t==0){  // if문 기초적인것
//                $('.sub_ani02').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 700){
//              if(t==0){  // if문 기초적인것
//                $('.sub_ani03').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 1000){
//              if(t==0){  // if문 기초적인것
//                $('.sub_ani04').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        /*01_sub04_B*/
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 230){
//              if(t==0){  // if문 기초적인것
//                $('.sub_ani05').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        /*01_sub04_C*/
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 250){
//              if(t==0){
//                $('.sub_ani06').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 450){
//              if(t==0){
//                $('.sub_ani07').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//        $(function(){
//          var t = 0;
//          $(window).scroll(function(){
//            if($(window).scrollTop() > 750){
//              if(t==0){
//                $('.sub_ani08').stop().animate({"opacity":1,"bottom":0},800);
//                t = 1;
//              }
//            }
//          })
//        });
//
//      /*03_sub01*/
//
//      $(function(){
//        var t = 0;
//        $(window).scroll(function(){
//          if($(window).scrollTop() > 250){
//            if(t==0){
//              $('.sub_ani10').stop().animate({"opacity":1,"bottom":0},800);
//              t = 1;
//            }
//          }
//        })
//      });
//
//      /*03_sub02*/
//
//      $(function(){
//        var t = 0;
//        $(window).scroll(function(){
//          if($(window).scrollTop() > 350){
//            if(t==0){  // if문 기초적인것
//              $('.sub_ani11').stop().animate({"opacity":1,"bottom":0},500);
//              $('.sub_ani12').stop().animate({"opacity":1,"bottom":0},800);
//              $('.sub_ani13').stop().animate({"opacity":1,"bottom":0},1200);
//              $('.sub_ani14').stop().animate({"opacity":1,"bottom":0},1500);
//              $('.sub_ani15').stop().animate({"opacity":1,"bottom":0},2000);
//              t = 1;
//            }
//          }
//        })
//      });



function menuHoverEvent(){

	$(".g_sub_menu").hover(function(){
		$(".hvr-bounce-to-bottom").css('background-color','#bc1225');

		var domIdx = $(this).attr('class').split(' ')[1].replace('gnb_off', '');

		$(".gnb_on"+domIdx).css('background-color','#8b0f1d')
	})

	$(".g_sub_menu").mouseleave(function(){
		$('nav > ul > li').not("nav > ul > li:last-child").css({"background":"#bc1225"});
	});


		$('.header_gnb').hide();
			$('nav > ul > li , .header_gnb').mouseover(function(){
				$('.header_gnb').stop().slideDown(100);
			})

			$('nav > ul > li , .header_gnb').mouseleave(function(){
				$('.header_gnb').stop().slideUp(100);
			})


	//★nav아코디언메뉴★
	// var abc = 0;
		var intervalCount = 0;
		var intervalCheckBeforeHeight = 0;

		$(".g_sub_menu > li").on('click',function(){
			var flag = $(this).data('flag');
			if(flag=='y'){
				$(this).children(".off").stop().slideUp(200);
				$(this).find("span").removeClass("on");
				$(this).children("a").css({"color":"#666","font-weight":"500","text-decoration":"none"});
				var t = 0;
				$(this).children("a").hover(function(){
					if(t==0){
						$(this).css({"color":"#666","font-weight":"500","text-decoration":"none"});
						t = 1;
					}else{
						$(this).css({"color":"#bc1225","font-weight":"600","text-decoration":"underline","text-underline-postion":"under"});
						t = 0;
					}
				})
				$(".g_sub_menu").css({"height":"auto"});

				$(this).data('flag', 'n');

			// abc = 0;
			}else{
				$(this).children(".off").stop().slideDown(200);
				$(this).find("span").addClass("on");
				$(".g_sub_menu").css({"height":"auto"});
				$(this).children("a").css({"color":"#bc1225","font-weight":"600","text-decoration":"underline"});
				// abc = 1;
				$(this).data('flag', 'y');
			}

			 intervalCount = 0;
			 intervalCheckBeforeHeight = 0;

			var interval = setInterval(function(){
				var maxHeight = 0;
				$(".g_sub_menu").each(function(){
					if($(this).height() > maxHeight){
						maxHeight = $(this).height();

					}
				});
				$(".gnb_sil").height(maxHeight);
				$(".gnb_sil").width(1);

				if(intervalCheckBeforeHeight == maxHeight){
					intervalCount++;
				}else{
					intervalCheckBeforeHeight = maxHeight;
				}

				if(intervalCount > 3){
					clearInterval(interval);
				}

			},100);

		});

};

// function menuHoverEvent2(){
// 	console.log('222222222222222222222');
// $('.gnb_off01').mouseenter(function(){
// 	$('.gnb_on01').css({"background":"#8b0f1d"});
// })
//
// $('.gnb_off01').mouseleave(function(){
// 	$('.gnb_on01').css({"background":"#bc1225"});
// })
// }

/*sub_page에서 로그인창 보이기 안보이기*/


// window.onload = function() {
//
//     setTimeout (function () {
//
//     $('#login_box').css({"z-index":"4"});
//   },0);
//
// }
//
// $(function(){
// 	var t = 0;
// 	$(window).scroll(function(){
// 		if($(window).scrollTop() >= 0){
// 			if(t==0){  // if문 기초적인것
// 				$("#login_box").css({"display":"block"});
// 				t = 1;
// 			}else{
// 				$("#login_box").css({"position":"fixed" , "top":"150px", "right":"311px" , "z-index":"4"});
// 				t = 0;
// 			}
// 		}
// 	})
// });
//
//





//폼 정렬 관련
(function($){
    $.fn.serializeObject = function(){

        var self = this,
            json = {},
            push_counters = {},
            patterns = {
                "validate": /^[a-zA-Z][a-zA-Z0-9_]*(?:\[(?:\d*|[a-zA-Z0-9_]+)\])*$/,
                "key":      /[a-zA-Z0-9_]+|(?=\[\])/g,
                "push":     /^$/,
                "fixed":    /^\d+$/,
                "named":    /^[a-zA-Z0-9_]+$/
            };


        this.build = function(base, key, value){
            base[key] = value;
            return base;
        };

        this.push_counter = function(key){
            if(push_counters[key] === undefined){
                push_counters[key] = 0;
            }
            return push_counters[key]++;
        };

        $.each($(this).serializeArray(), function(){

            // Skip invalid keys
            if(!patterns.validate.test(this.name)){
                return;
            }

            var k,
                keys = this.name.match(patterns.key),
                merge = this.value,
                reverse_key = this.name;

            while((k = keys.pop()) !== undefined){

                // Adjust reverse_key
                reverse_key = reverse_key.replace(new RegExp("\\[" + k + "\\]$"), '');

                // Push
                if(k.match(patterns.push)){
                    merge = self.build([], self.push_counter(reverse_key), merge);
                }

                // Fixed
                else if(k.match(patterns.fixed)){
                    merge = self.build([], k, merge);
                }

                // Named
                else if(k.match(patterns.named)){
                    merge = self.build({}, k, merge);
                }
            }

            json = $.extend(true, json, merge);
        });

        return json;
    };
})(jQuery);

//startsWith
if (!String.prototype.startsWith) {
    Object.defineProperty(String.prototype, 'startsWith', {
        value: function(search, rawPos) {
            var pos = rawPos > 0 ? rawPos|0 : 0;
            return this.substring(pos, pos + search.length) === search;
        }
    });
}

//endWidth
if (!String.prototype.endsWith) {
	String.prototype.endsWith = function(search, this_len) {
		if (this_len === undefined || this_len > this.length) {
			this_len = this.length;
		}
		return this.substring(this_len - search.length, this_len) === search;
	};
}


//axios 관련
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
axios.defaults.headers.common[header]  = token;

//쿠키 관련


function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function saveUserId(id) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
//    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
//    else
//        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", id, expdate);
}

function saveUserPw(pw){
	var expdate = new Date();
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    setCookie("savepw", pw, expdate);
}

function getId() {
    return getCookie("saveid");
}
function getPw(){
	return getCookie("savepw");
}

function skipPopup(){
	var expdate = new Date();
    //expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 7); // 7일
	expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 1); // 1일
    setCookie("skipPopup", 'true', expdate);
}

function getSkipPopup(){
	return getCookie("skipPopup");
}



//찾아오시는길 viewport

$(document).ready(function(){
	
	if($(location).attr('pathname') != '/'){
		$(window).scrollTop('223');
	}
	
	var filter = "win16|win32|win64|mac|macintel";

	if ( navigator.platform ) { 
		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
			var WinW = $(window).width();
//			if (WinW >= 800 ) { //800px 보다 클 경우~
//			    $('.map_area').css({"left":"0","top":"658px","width":"1280px"});
//			    $('#seegene_map,#seegene_map2,#seegene_map3,#seegene_map4').css({"width":"1280px"});
			   
		}
	}
});

// 메인롤링배너

$(document).ready(function(){

	var slide=$('.rolling_banner');
	var slideWidth=slide.width();
	var slideList=$('.rolling_banner>a');
	var slideListWidth=$('.rolling_banner>a').width()+slideWidth*0.215;
	var current=0;
	var setInterval01;

	var btnList=$('ul.btn>li');


	mainSlide();
	function mainSlide(){
		setInterval01=setInterval(function(){
			slide.stop().animate({left:-slideListWidth},1000, function(){
				$('.rolling_banner>a:first').insertAfter('.rolling_banner>a:last');
				slide.css('left',0);
			});

			btnList.removeClass('bg_black');
			current++;
			if(current == btnList.size()){current=0};
			btnList.eq(current).addClass('bg_black');
		},5500)
	}

	$('.rolling_banner , .R_main_prev , .R_main_next').hover(function(){
		clearInterval(setInterval01);
	}, function(){
		mainSlide();
	})
	
	
//	$(function(){
//		var t = 0;
//
//	$('.R_main_prev , .R_main_next').hide();
//	$('.rolling_all').hover(function(){
//		if(t==0){
//			$('.R_main_prev , .R_main_next').show();
//			t = 1;
//		}else{
//			$('.R_main_prev , .R_main_next').hide();
//			t = 0;
//		}
//		
//	  })
//	})
	
	function next(){
		slide.animate({left:-slideListWidth},300, function(){
			$('.rolling_banner>a:first').insertAfter('.rolling_banner>a:last');
			slide.css('left',0);
		});

	}

	function prev(){
		$('.rolling_banner>a:last').insertBefore('.rolling_banner>a:first');
		slide.css('left',-slideListWidth);
		slide.animate({left:0},300);

	}

	$('.R_main_prev').click(function(){
		prev();
	})

	$('.R_main_next').click(function(){
		next();
	})

	btnList.click(function(){
		var th=$(this);
		var i=th.index();
		var bgBlack=$('ul.btn>li.bg_black');
		var bgBlacki=bgBlack.index();
		var slideListi=slideList.eq(i);
		var Ltt=$('.rolling_banner>a:eq(0)').nextUntil(slideListi);


	})
});

//메인롤링배너 영문

//$(document).ready(function(){
//
//	var slide=$('.rolling_banner_en');
//	var slideWidth=slide.width();
//	var slideList=$('.rolling_banner_en>a');
//	var slideListWidth=$('.rolling_banner_en>a').width()+slideWidth*0.215;
//	var current=0;
//	var setInterval01;
//
//	var btnList=$('ul.btn>li');
//
//
//	mainSlide();
//	function mainSlide(){
//		setInterval01=setInterval(function(){
//			slide.stop().animate({left:-slideListWidth},1000, function(){
//				$('.rolling_banner_en>a:first').insertAfter('.rolling_banner_en>a:last');
//				slide.css('left',0);
//			});
//
//			btnList.removeClass('bg_black_en');
//			current++;
//			if(current == btnList.size()){current=0};
//			btnList.eq(current).addClass('bg_black_en');
//		},5500)
//	}
//	
//	$('.rolling_banner_en , .R_main_prev_en , .R_main_next_en').hover(function(){
//		clearInterval(setInterval01);
//	}, function(){
//		mainSlide();
//	})
//	
//	function next(){
//		slide.animate({left:-slideListWidth},300, function(){
//			$('.rolling_banner_en>a:first').insertAfter('.rolling_banner_en>a:last');
//			slide.css('left',0);
//		});
//
//	}
//
//	function prev(){
//		$('.rolling_banner_en>a:last').insertBefore('.rolling_banner_en>a:first');
//		slide.css('left',-slideListWidth);
//		slide.animate({left:0},300);
//
//	}
//
//	$('.R_main_prev_en').click(function(){
//		prev();
//	})
//
//	$('.R_main_next_en').click(function(){
//		next();
//	})
//
//	$('.rolling_banner_en').hover(function(){
//		clearInterval(setInterval01);
//	}, function(){
//		mainSlide();
//	})
//
//	btnList.click(function(){
//		var th=$(this);
//		var i=th.index();
//		var bgBlack=$('ul.btn>li.bg_black_en');
//		var bgBlacki=bgBlack.index();
//		var slideListi=slideList.eq(i);
//		var Ltt=$('.rolling_banner_en>a:eq(0)').nextUntil(slideListi);
//
//
//	})
//});

//UI = {
//		Load: function(){
//			UI.Rolling();
//		},
//
//		Rolling: function(){
//			var ground = $('.down_rolling'),
//				imgs_wrap = ground.find('.imgs'),
//				imgs = imgs_wrap.children(),
//				size = imgs.width()+10,
//				btn_prev = ground.find('.btn_prev'),
//				btn_next = ground.find('.btn_next');
//
//			//default
//			imgs_wrap.css('left',-size);
//			imgs_wrap.children('li:last').prependTo(imgs_wrap);
//
//			var prev = function(){
//				imgs_wrap.stop().animate({'left':0}, 300, 'easeInQuad', function(){
//					$(this).children('li:last').prependTo(this);
//					$(this).css({'left':-size});
//				});
//			}
//
//			var next = function(){
//				imgs_wrap.stop().animate({'left':-(size*2)}, 300, 'easeInQuad', function(){
//					$(this).children('li:first').appendTo(this);
//					$(this).css({'left':-size});
//				});
//			}
//
//			btn_prev.click(function(){
//				prev();
//			});
//
//			btn_next.click(function(){
//				next();
//			});
//
//			var start = function(){
//				set_interval = setInterval(function(){
//					next();
//				}, 5000);//5초 자동롤링
//			}
//
//			start();
//		}};

//헤더스크롤

//$(function () {
//    var lastScrollTop = 0,
//        delta = 70;
//    $(window).scroll(function (event) {
//        var st = $(this).scrollTop();
//        if (Math.abs(lastScrollTop - st) <= delta) return;
//        if ((st > lastScrollTop) && (lastScrollTop > 0)) {
//            $("#fixed_gnb , #wrap > header").css("top", "-150px");
//        } else {
//            $("#fixed_gnb , #wrap > header").css("top", "0px");
//        }
//        lastScrollTop = st;
//    });
//});
//
//$(function (){
//	var lastScrollTop = 0.
//	delta = 70;
//	$(window).scroll(function (event){
//		var st = $(this).scollTop();
//		if (Math.abs(lastScrollTop - st) <= delta) return;
//		if((st > lastScrollTop) && (lastScrollTop > 0)) {}
//	})
//})

// 메인팝업슬라이드

$(document).ready(function(){
//	function bannerset(bn,dir){
//	    if(dir=='right'){
//	        var variable_width = $(".main_panel").width();
//	        $('.main_slide .main_dot li.on').removeClass('on');
//	        $('.main_slide .main_dot li:eq('+bn+')').addClass('on');
//	        $('.main_slide .main_panel li:eq('+bn+')').show();
//	        $('.main_slide .main_panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
//	        $('.main_slide .main_panel li.on').fadeOut(function(){
//	            $(this).hide();
//	            $(this).removeClass('on');
//	        })
//	        $('.main_slide .main_panel li:eq('+bn+')').animate({'top':'15px'},300,function(){
//	            $(this).addClass('on');
//	        })
//	    }else{
//	        var variable_width = $(".main_panel").width();
//	        $('.main_slide .main_dot li.on').removeClass('on');
//	        $('.main_slide .main_dot li:eq('+bn+')').addClass('on');
//	        $('.main_slide .main_panel li:eq('+bn+')').show();
//	        $('.main_slide .main_panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
//	        $('.main_slide .main_panel li.on').fadeOut(function(){
//	            $(this).hide();
//	            $(this).removeClass('on');
//	        })
//	        $('.main_slide .main_panel li:eq('+bn+')').animate({'top':'15px'},300,function(){
//	        	console.log($(this).data('title'));
//	            $(this).addClass('on');
//	        })
//	    }
//	}

//	$(document).ready(function(){
//	    $('.main_slide .main_panel li:gt(0)').hide();
//	    //동그라미 버튼 클릭했을 때
//	    $('.main_slide .main_dot li').on('click',function(e){
//	        e.preventDefault();
//	        if($('.main_slide .main_panel li.on').is(':animated')==false){
//	            var num = $(this).index();
//	            var currentNum = $('.main_slide .main_dot > li.on').index();
//	            if(num > currentNum){
//	                bannerset(num,'right')
//	            }else if(num < currentNum){
//	                bannerset(num,'left')
//	            }
//	        }
//
//	    })
//	    
//	})
	
	//click 이벤트
	$(document).ready(function(){
	
	var slide=$('.main_dot');
	var slideWidth=slide.width();
	var slideList=$('.main_dot>li');
	var slideListWidth=$('.main_dot>li').width()+slideWidth*0.02;

	function next(){
		slide.animate({left:-slideListWidth},100, function(){
			$('.main_dot>li:first').insertAfter('.main_dot>li:last');
			slide.css('left',0);
		});

	}

	function prev(){
		$('.main_dot>li:last').insertBefore('.main_dot>li:first');
		slide.css('left',-slideListWidth);
		slide.animate({left:0},100);

	}

	$('.main_prev').click(function(){
		prev();
	})

	$('.main_next').click(function(){
		next();
			})
	
		});

	});

//$(function(){
//	        $('#main_modal > .popup_bg , .close_bt , .close_bt2').click(function(){
//	          $('#main_modal').fadeOut(300);
//	        })
//	    });

// 인증현황 tab

//$(document).ready(function(){
//	var t = 0;
//	$('.center01').click(function(){
//		if(t==0){
//			$('.center01 > li > span').addClass('grayeon');
//		}else{
//		 if(t==1){
//			$('.center01 > li > span').addClass('grayoff');	
//			}
//		}
//	})
//})



function CheckPassword(upw)

{
    if(upw.length < 6 || upw.length > 20)

    { 
        alert('비밀번호는 숫자와 영문자 조합으로 6~20자리를 사용해야 합니다.'); 
        return false;
    }

  
    var chk_num = upw.search(/[0-9]/g);
    var chk_eng = upw.search(/[a-z]/ig);

    if(chk_num < 0 || chk_eng < 0)

    {
        alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
        return false;
    }

    return true;

}

//파라미터 조회
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
