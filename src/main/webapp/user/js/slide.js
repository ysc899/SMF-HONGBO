//메인 슬라이드 배너

      /*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal .slide .dot li.on').removeClass('on');
        $('#modal .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal .banner_text').addClass('on');
          $('#modal .banner_text').hide();
          $('#modal .banner_text').delay(500).fadeIn(300);
        $('#modal .slide .panel li:eq('+bn+')').show();
        $('#modal .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal .slide .dot li.on').removeClass('on');
        $('#modal .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal .banner_text').addClass('on');
          $('#modal .banner_text').hide();
          $('#modal .banner_text').delay(500).fadeIn(300);
        $('#modal .slide .panel li:eq('+bn+')').show();
        $('#modal .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-2*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal2 .slide .dot li.on').removeClass('on');
        $('#modal2 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal2 .banner_text').addClass('on');
          $('#modal2 .banner_text').hide();
          $('#modal2 .banner_text').delay(500).fadeIn(300);
        $('#modal2 .slide .panel li:eq('+bn+')').show();
        $('#modal2 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal2 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal2 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal2 .slide .dot li.on').removeClass('on');
        $('#modal2 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal2 .banner_text').addClass('on');
          $('#modal2 .banner_text').hide();
          $('#modal2 .banner_text').delay(500).fadeIn(300);
        $('#modal2 .slide .panel li:eq('+bn+')').show();
        $('#modal2 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal2 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal2 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal2 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal2 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal2 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal2 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal2 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal2 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal2 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal2 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal2 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal2 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal2 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal2 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal3 .slide .dot li.on').removeClass('on');
        $('#modal3 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal3 .banner_text').addClass('on');
          $('#modal3 .banner_text').hide();
          $('#modal3 .banner_text').delay(500).fadeIn(300);
        $('#modal3 .slide .panel li:eq('+bn+')').show();
        $('#modal3 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal3 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal3 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal3 .slide .dot li.on').removeClass('on');
        $('#modal3 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal3 .banner_text').addClass('on');
          $('#modal3 .banner_text').hide();
          $('#modal3 .banner_text').delay(500).fadeIn(300);
        $('#modal3 .slide .panel li:eq('+bn+')').show();
        $('#modal3 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal3 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal3 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal3 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal3 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal3 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal3 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal3 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal3 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal3 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal3 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal3 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal3 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal3 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal3 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal4 .slide .dot li.on').removeClass('on');
        $('#modal4 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal4 .banner_text').addClass('on');
          $('#modal4 .banner_text').hide();
          $('#modal4 .banner_text').delay(500).fadeIn(300);
        $('#modal4 .slide .panel li:eq('+bn+')').show();
        $('#modal4 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal4 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal4 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal4 .slide .dot li.on').removeClass('on');
        $('#modal4 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal4 .banner_text').addClass('on');
          $('#modal4 .banner_text').hide();
          $('#modal4 .banner_text').delay(500).fadeIn(300);
        $('#modal4 .slide .panel li:eq('+bn+')').show();
        $('#modal4 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal4 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal4 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal4 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal4 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal4 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal4 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal4 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal4 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal4 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal4 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal4 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal4 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal4 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal4 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal5 .slide .dot li.on').removeClass('on');
        $('#modal5 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal5 .banner_text').addClass('on');
          $('#modal5 .banner_text').hide();
          $('#modal5 .banner_text').delay(500).fadeIn(300);
        $('#modal5 .slide .panel li:eq('+bn+')').show();
        $('#modal5 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal5 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal5 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal5 .slide .dot li.on').removeClass('on');
        $('#modal5 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal5 .banner_text').addClass('on');
          $('#modal5 .banner_text').hide();
          $('#modal5 .banner_text').delay(500).fadeIn(300);
        $('#modal5 .slide .panel li:eq('+bn+')').show();
        $('#modal5 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal5 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal5 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal5 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal5 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal5 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal5 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal5 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal5 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal5 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal5 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal5 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal5 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal5 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal5 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal6 .slide .dot li.on').removeClass('on');
        $('#modal6 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal6 .banner_text').addClass('on');
          $('#modal6 .banner_text').hide();
          $('#modal6 .banner_text').delay(500).fadeIn(300);
        $('#modal6 .slide .panel li:eq('+bn+')').show();
        $('#modal6 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal6 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal6 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal6 .slide .dot li.on').removeClass('on');
        $('#modal6 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal6 .banner_text').addClass('on');
          $('#modal6 .banner_text').hide();
          $('#modal6 .banner_text').delay(500).fadeIn(300);
        $('#modal6 .slide .panel li:eq('+bn+')').show();
        $('#modal6 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal6 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal6 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal6 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal6 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal6 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal6 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal6 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal6 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal6 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal6 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal6 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal6 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal6 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal6 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal7 .slide .dot li.on').removeClass('on');
        $('#modal7 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal7 .banner_text').addClass('on');
          $('#modal7 .banner_text').hide();
          $('#modal7 .banner_text').delay(500).fadeIn(300);
        $('#modal7 .slide .panel li:eq('+bn+')').show();
        $('#modal7 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal7 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal7 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal7 .slide .dot li.on').removeClass('on');
        $('#modal7 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal7 .banner_text').addClass('on');
          $('#modal7 .banner_text').hide();
          $('#modal7 .banner_text').delay(500).fadeIn(300);
        $('#modal7 .slide .panel li:eq('+bn+')').show();
        $('#modal7 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal7 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal7 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal7 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal7 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal7 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal7 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal7 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal7 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal7 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal7 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal7 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal7 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal7 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal7 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal8 .slide .dot li.on').removeClass('on');
        $('#modal8 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal8 .banner_text').addClass('on');
          $('#modal8 .banner_text').hide();
          $('#modal8 .banner_text').delay(500).fadeIn(300);
        $('#modal8 .slide .panel li:eq('+bn+')').show();
        $('#modal8 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal8 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal8 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal8 .slide .dot li.on').removeClass('on');
        $('#modal8 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal8 .banner_text').addClass('on');
          $('#modal8 .banner_text').hide();
          $('#modal8 .banner_text').delay(500).fadeIn(300);
        $('#modal8 .slide .panel li:eq('+bn+')').show();
        $('#modal8 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal8 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal8 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal8 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal8 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal8 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal8 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal8 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal8 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal8 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal8 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal8 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal8 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal8 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal8 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal9 .slide .dot li.on').removeClass('on');
        $('#modal9 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal9 .banner_text').addClass('on');
          $('#modal9 .banner_text').hide();
          $('#modal9 .banner_text').delay(500).fadeIn(300);
        $('#modal9 .slide .panel li:eq('+bn+')').show();
        $('#modal9 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal9 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal9 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal9 .slide .dot li.on').removeClass('on');
        $('#modal9 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal9 .banner_text').addClass('on');
          $('#modal9 .banner_text').hide();
          $('#modal9 .banner_text').delay(500).fadeIn(300);
        $('#modal9 .slide .panel li:eq('+bn+')').show();
        $('#modal9 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal9 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal9 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal9 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal9 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal9 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal9 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal9 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal9 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal9 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal9 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal9 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal9 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal9 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal9 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal10 .slide .dot li.on').removeClass('on');
        $('#modal10 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal10 .banner_text').addClass('on');
          $('#modal10 .banner_text').hide();
          $('#modal10 .banner_text').delay(500).fadeIn(300);
        $('#modal10 .slide .panel li:eq('+bn+')').show();
        $('#modal10 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal10 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal10 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal10 .slide .dot li.on').removeClass('on');
        $('#modal10 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal10 .banner_text').addClass('on');
          $('#modal10 .banner_text').hide();
          $('#modal10 .banner_text').delay(500).fadeIn(300);
        $('#modal10 .slide .panel li:eq('+bn+')').show();
        $('#modal10 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal10 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal10 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal10 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal10 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal10 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal10 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal10 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal10 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal10 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal10 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal10 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal10 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal10 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal10 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal11 .slide .dot li.on').removeClass('on');
        $('#modal11 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal11 .banner_text').addClass('on');
          $('#modal11 .banner_text').hide();
          $('#modal11 .banner_text').delay(500).fadeIn(300);
        $('#modal11 .slide .panel li:eq('+bn+')').show();
        $('#modal11 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal11 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal11 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal11 .slide .dot li.on').removeClass('on');
        $('#modal11 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal11 .banner_text').addClass('on');
          $('#modal11 .banner_text').hide();
          $('#modal11 .banner_text').delay(500).fadeIn(300);
        $('#modal11 .slide .panel li:eq('+bn+')').show();
        $('#modal11 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal11 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal11 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal11 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal11 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal11 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal11 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal11 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal11 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal11 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal11 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal11 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal11 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal11 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal11 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal12 .slide .dot li.on').removeClass('on');
        $('#modal12 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal12 .banner_text').addClass('on');
          $('#modal12 .banner_text').hide();
          $('#modal12 .banner_text').delay(500).fadeIn(300);
        $('#modal12 .slide .panel li:eq('+bn+')').show();
        $('#modal12 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal12 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal12 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal12 .slide .dot li.on').removeClass('on');
        $('#modal12 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal12 .banner_text').addClass('on');
          $('#modal12 .banner_text').hide();
          $('#modal12 .banner_text').delay(500).fadeIn(300);
        $('#modal12 .slide .panel li:eq('+bn+')').show();
        $('#modal12 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal12 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal12 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal12 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal12 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal12 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal12 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal12 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal12 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal12 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal12 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal12 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal12 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal12 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal12 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal13 .slide .dot li.on').removeClass('on');
        $('#modal13 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal13 .banner_text').addClass('on');
          $('#modal13 .banner_text').hide();
          $('#modal13 .banner_text').delay(500).fadeIn(300);
        $('#modal13 .slide .panel li:eq('+bn+')').show();
        $('#modal13 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal13 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal13 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal13 .slide .dot li.on').removeClass('on');
        $('#modal13 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal13 .banner_text').addClass('on');
          $('#modal13 .banner_text').hide();
          $('#modal13 .banner_text').delay(500).fadeIn(300);
        $('#modal13 .slide .panel li:eq('+bn+')').show();
        $('#modal13 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal13 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal13 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal13 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal13 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal13 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal13 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal13 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal13 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal13 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal13 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal13 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal13 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal13 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal13 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal14 .slide .dot li.on').removeClass('on');
        $('#modal14 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal14 .banner_text').addClass('on');
          $('#modal14 .banner_text').hide();
          $('#modal14 .banner_text').delay(500).fadeIn(300);
        $('#modal14 .slide .panel li:eq('+bn+')').show();
        $('#modal14 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal14 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal14 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal14 .slide .dot li.on').removeClass('on');
        $('#modal14 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal14 .banner_text').addClass('on');
          $('#modal14 .banner_text').hide();
          $('#modal14 .banner_text').delay(500).fadeIn(300);
        $('#modal14 .slide .panel li:eq('+bn+')').show();
        $('#modal14 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal14 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal14 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal14 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal14 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal14 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal14 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal14 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal14 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal14 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal14 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal14 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal14 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal14 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal14 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal15 .slide .dot li.on').removeClass('on');
        $('#modal15 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal15 .banner_text').addClass('on');
          $('#modal15 .banner_text').hide();
          $('#modal15 .banner_text').delay(500).fadeIn(300);
        $('#modal15 .slide .panel li:eq('+bn+')').show();
        $('#modal15 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal15 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal15 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal15 .slide .dot li.on').removeClass('on');
        $('#modal15 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal15 .banner_text').addClass('on');
          $('#modal15 .banner_text').hide();
          $('#modal15 .banner_text').delay(500).fadeIn(300);
        $('#modal15 .slide .panel li:eq('+bn+')').show();
        $('#modal15 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal15 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal15 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal15 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal15 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal15 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal15 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal15 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal15 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal15 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal15 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal15 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal15 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal15 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal15 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*chap-1*/
$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel").width();
        $('#modal16 .slide .dot li.on').removeClass('on');
        $('#modal16 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal16 .banner_text').addClass('on');
          $('#modal16 .banner_text').hide();
          $('#modal16 .banner_text').delay(500).fadeIn(300);
        $('#modal16 .slide .panel li:eq('+bn+')').show();
        $('#modal16 .slide .panel li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('#modal16 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal16 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel").width();
        $('#modal16 .slide .dot li.on').removeClass('on');
        $('#modal16 .slide .dot li:eq('+bn+')').addClass('on');
          $('#modal16 .banner_text').addClass('on');
          $('#modal16 .banner_text').hide();
          $('#modal16 .banner_text').delay(500).fadeIn(300);
        $('#modal16 .slide .panel li:eq('+bn+')').show();
        $('#modal16 .slide .panel li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('#modal16 .slide .panel li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('#modal16 .slide .panel li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('#modal16 .slide .panel li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('#modal16 .slide .dot li').on('click',function(e){
        e.preventDefault();
        if($('#modal14 .slide .panel li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('#modal16 .slide .dot li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('#modal16 .arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('#modal16 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal16 .slide .dot li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('#modal16 .dot li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('#modal16 .arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('#modal16 .slide .panel li.on').is(':animated')==false){
            var currentNum = $('#modal16 .slide .dot li.on').index();
            var num = currentNum+1;
            if(num>$('#modal16 .dot li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*modal popup*/

$(function(){
	  $('#modal').hide();
	    $('.check_popupbt').click(function(){
	      $('#modal').stop().fadeIn(300);
	        $('#modal > .popup_bg , .close_bt').click(function(){
	          $('#modal').fadeOut(300);
	        })
	    });
	})
	
$(function(){
  $('#modal2').hide();
    $('.check_popupbt2').click(function(){
      $('#modal2').stop().fadeIn(300);
        $('#modal2 > .popup_bg , .close_bt').click(function(){
          $('#modal2').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal3').hide();
    $('.check_popupbt3').click(function(){
      $('#modal3').stop().fadeIn(300);
        $('#modal3 > .popup_bg , .close_bt').click(function(){
          $('#modal3').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal4').hide();
    $('.check_popupbt4').click(function(){
      $('#modal4').stop().fadeIn(300);
        $('#modal4 > .popup_bg , .close_bt').click(function(){
          $('#modal4').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal5').hide();
    $('.check_popupbt5').click(function(){
      $('#modal5').stop().fadeIn(300);
        $('#modal5 > .popup_bg , .close_bt').click(function(){
          $('#modal5').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal6').hide();
    $('.check_popupbt6').click(function(){
      $('#modal6').stop().fadeIn(300);
        $('#modal6 > .popup_bg , .close_bt').click(function(){
          $('#modal6').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal7').hide();
    $('.check_popupbt7').click(function(){
      $('#modal7').stop().fadeIn(300);
        $('#modal7 > .popup_bg , .close_bt').click(function(){
          $('#modal7').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal8').hide();
    $('.check_popupbt8').click(function(){
      $('#modal8').stop().fadeIn(300);
        $('#modal8 > .popup_bg , .close_bt').click(function(){
          $('#modal8').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal9').hide();
    $('.check_popupbt9').click(function(){
      $('#modal9').stop().fadeIn(300);
        $('#modal9 > .popup_bg , .close_bt').click(function(){
          $('#modal9').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal10').hide();
    $('.check_popupbt10').click(function(){
      $('#modal10').stop().fadeIn(300);
        $('#modal10 > .popup_bg , .close_bt').click(function(){
          $('#modal10').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal11').hide();
    $('.check_popupbt11').click(function(){
      $('#modal11').stop().fadeIn(300);
        $('#modal11 > .popup_bg , .close_bt').click(function(){
          $('#modal11').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal12').hide();
    $('.check_popupbt12').click(function(){
      $('#modal12').stop().fadeIn(300);
        $('#modal12 > .popup_bg , .close_bt').click(function(){
          $('#modal12').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal13').hide();
    $('.check_popupbt13').click(function(){
      $('#modal13').stop().fadeIn(300);
        $('#modal13 > .popup_bg , .close_bt').click(function(){
          $('#modal13').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal14').hide();
    $('.check_popupbt14').click(function(){
      $('#modal14').stop().fadeIn(300);
        $('#modal14 > .popup_bg , .close_bt').click(function(){
          $('#modal14').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal15').hide();
    $('.check_popupbt15').click(function(){
      $('#modal15').stop().fadeIn(300);
        $('#modal15 > .popup_bg , .close_bt').click(function(){
          $('#modal15').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal16').hide();
    $('.check_popupbt16').click(function(){
      $('#modal16').stop().fadeIn(300);
        $('#modal16 > .popup_bg , .close_bt').click(function(){
          $('#modal16').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal17').hide();
    $('.check_introduce').click(function(){
      $('#modal17').stop().fadeIn(300);
        $('#modal17 > .popup_bg , .close_bt').click(function(){
          $('#modal17').fadeOut(300);
        })
    });
})

//지역검사센터 팝업

$(function(){
  $('#modal_p1').hide();
    $('.center_img_bt1, .c_img1').click(function(){
      $('#modal_p1').stop().fadeIn(300);
        $('#modal_p1 > .popup_bg , .close_bt').click(function(){
          $('#modal_p1').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal_p2').hide();
    $('.center_img_bt2, .c_img2').click(function(){
      $('#modal_p2').stop().fadeIn(300);
        $('#modal_p2 > .popup_bg , .close_bt').click(function(){
          $('#modal_p2').fadeOut(300);
        })
    });
})


$(function(){
  $('#modal_p3').hide();
    $('.center_img_bt3, .c_img3').click(function(){
      $('#modal_p3').stop().fadeIn(300);
        $('#modal_p3 > .popup_bg , .close_bt').click(function(){
          $('#modal_p3').fadeOut(300);
        })
    });
})

$(function(){
  $('#modal_p4').hide();
    $('.center_img_bt4, .c_img4').click(function(){
      $('#modal_p4').stop().fadeIn(300);
        $('#modal_p4 > .popup_bg , .close_bt').click(function(){
          $('#modal_p4').fadeOut(300);
        })
    });
})

$(function(){
    $('#modal_p5').hide();
      $('.center_img_bt5, .c_img5').click(function(){
        $('#modal_p5').stop().fadeIn(300);
          $('#modal_p5 > .popup_bg , .close_bt').click(function(){
            $('#modal_p5').fadeOut(300);
        })
    });
})


/*부산*/

$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel1").width();
        $('.slide1 .dot1 li.on').removeClass('on');
        $('.slide1 .dot1 li:eq('+bn+')').addClass('on');
        $('.slide1 .panel1 li:eq('+bn+')').show();
        $('.slide1 .panel1 li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('.slide1 .panel1 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide1 .panel1 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel1").width();
        $('.slide1 .dot1 li.on').removeClass('on');
        $('.slide1 .dot1 li:eq('+bn+')').addClass('on');
        $('.slide1 .panel1 li:eq('+bn+')').show();
        $('.slide1 .panel1 li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('.slide1 .panel1 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide1 .panel1 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('.slide1 .panel1 li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('.slide1 .dot1 li').on('click',function(e){
        e.preventDefault();
        if($('.slide1 .panel1 li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('.slide1 .dot1 li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('.arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('.slide1 .panel1 li.on').is(':animated')==false){
            var currentNum = $('.slide1 .dot1 li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('.dot1 li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('.arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('.slide1 .panel1 li.on').is(':animated')==false){
            var currentNum = $('.slide1 .dot1 li.on').index();
            var num = currentNum+1;
            if(num>$('.dot1 li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*대구*/

$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel2").width();
        $('.slide2 .dot2 li.on').removeClass('on');
        $('.slide2 .dot2 li:eq('+bn+')').addClass('on');
        $('.slide2 .panel2 li:eq('+bn+')').show();
        $('.slide2 .panel2 li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('.slide2 .panel2 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide2 .panel2 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel2").width();
        $('.slide2 .dot2 li.on').removeClass('on');
        $('.slide2 .dot2 li:eq('+bn+')').addClass('on');
        $('.slide2 .panel2 li:eq('+bn+')').show();
        $('.slide2 .panel2 li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('.slide2 .panel2 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide2 .panel2 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('.slide2 .panel2 li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('.slide2 .dot2 li').on('click',function(e){
        e.preventDefault();
        if($('.slide2 .panel2 li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('.slide2 .dot2 li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('.arrow_area .prev2').on('click',function(e){
        e.preventDefault();
        if($('.slide2 .panel2 li.on').is(':animated')==false){
            var currentNum = $('.slide2 .dot2 li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('.dot2 li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('.arrow_area .next2').on('click',function(e){
        e.preventDefault();
        if($('.slide2 .panel2 li.on').is(':animated')==false){
            var currentNum = $('.slide2 .dot2 li.on').index();
            var num = currentNum+1;
            if(num>$('.dot2 li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*대전*/

$(document).ready(function(){
    function bannerset(bn,dir){
        if(dir=='right'){
            var variable_width = $(".panel5").width();
            $('.slide5 .dot5 li.on').removeClass('on');
            $('.slide5 .dot5 li:eq('+bn+')').addClass('on');
            $('.slide5 .panel5 li:eq('+bn+')').show();
            $('.slide5 .panel5 li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
            $('.slide5 .panel5 li.on').fadeOut(function(){
                $(this).hide();
                $(this).removeClass('on');
            })
            $('.slide5 .panel5 li:eq('+bn+')').animate({'top':'0'},300,function(){
                $(this).addClass('on');
            })
        }else{
            var variable_width = $(".panel5").width();
            $('.slide5 .dot5 li.on').removeClass('on');
            $('.slide5 .dot5 li:eq('+bn+')').addClass('on');
            $('.slide5 .panel5 li:eq('+bn+')').show();
            $('.slide5 .panel5 li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
            $('.slide5 .panel5 li.on').fadeOut(function(){
                $(this).hide();
                $(this).removeClass('on');
            })
            $('.slide5 .panel5 li:eq('+bn+')').animate({'top':'0'},300,function(){
                $(this).addClass('on');
            })
        }
    }
    
    $(document).ready(function(){
        $('.slide5 .panel5 li:gt(0)').hide();
        //동그라미 버튼 클릭했을 때
        $('.slide5 .dot5 li').on('click',function(e){
            e.preventDefault();
            if($('.slide5 .panel5 li.on').is(':animated')==false){
                var num = $(this).index();
                var currentNum = $('.slide5 .dot5 li.on').index();
                if(num > currentNum){
                    bannerset(num,'right')
                }else if(num < currentNum){
                    bannerset(num,'left')
                }
            }
    
        })
        //이전버튼
        $('.arrow_area .prev5').on('click',function(e){
            e.preventDefault();
            if($('.slide5 .panel5 li.on').is(':animated')==false){
                var currentNum = $('.slide5 .dot5 li.on').index();
                var num = currentNum-1;
                if(num<0){
                    num = $('.dot5 li').length-1;
                }
                bannerset(num,'right')
            }
        })
        //다음버튼
        $('.arrow_area .next5').on('click',function(e){
            e.preventDefault();
            if($('.slide5 .panel5 li.on').is(':animated')==false){
                var currentNum = $('.slide5 .dot5 li.on').index();
                var num = currentNum+1;
                if(num>$('.dot5 li').length-1){
                    num = 0;
                }
                bannerset(num,'left')
            }
        })
    
    })
    
});

/*광주*/

$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel3").width();
        $('.slide3 .dot3 li.on').removeClass('on');
        $('.slide3 .dot3 li:eq('+bn+')').addClass('on');
        $('.slide3 .panel3 li:eq('+bn+')').show();
        $('.slide3 .panel3 li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('.slide3 .panel3 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide3 .panel3 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel3").width();
        $('.slide3 .dot3 li.on').removeClass('on');
        $('.slide3 .dot3 li:eq('+bn+')').addClass('on');
        $('.slide3 .panel3 li:eq('+bn+')').show();
        $('.slide3 .panel3 li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('.slide3 .panel3 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide3 .panel3 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('.slide3 .panel3 li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('.slide3 .dot3 li').on('click',function(e){
        e.preventDefault();
        if($('.slide3 .panel3 li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('.slide3 .dot3 li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('.arrow_area .prev3').on('click',function(e){
        e.preventDefault();
        if($('.slide3 .panel3 li.on').is(':animated')==false){
            var currentNum = $('.slide3 .dot3 li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('.dot3 li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('.arrow_area .next3').on('click',function(e){
        e.preventDefault();
        if($('.slide3 .panel3 li.on').is(':animated')==false){
            var currentNum = $('.slide3 .dot3 li.on').index();
            var num = currentNum+1;
            if(num>$('.dot3 li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

/*SKL*/

$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel4").width();
        $('.slide4 .dot4 li.on').removeClass('on');
        $('.slide4 .dot4 li:eq('+bn+')').addClass('on');
        $('.slide4 .panel4 li:eq('+bn+')').show();
        $('.slide4 .panel4 li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('.slide4 .panel4 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide4 .panel4 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel4").width();
        $('.slide4 .dot4 li.on').removeClass('on');
        $('.slide4 .dot4 li:eq('+bn+')').addClass('on');
        $('.slide4 .panel4 li:eq('+bn+')').show();
        $('.slide4 .panel4 li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('.slide4 .panel4 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide4 .panel4 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('.slide4 .panel4 li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('.slide4 .dot4 li').on('click',function(e){
        e.preventDefault();
        if($('.slide4 .panel4 li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('.slide4 .dot4 li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('.arrow_area .prev4').on('click',function(e){
        e.preventDefault();
        if($('.slide4 .panel4 li.on').is(':animated')==false){
            var currentNum = $('.slide4 .dot4 li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('.dot4 li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('.arrow_area .next4').on('click',function(e){
        e.preventDefault();
        if($('.slide4 .panel4 li.on').is(':animated')==false){
            var currentNum = $('.slide4 .dot4 li.on').index();
            var num = currentNum+1;
            if(num>$('.dot4 li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});

//Seechart 팝업

$(function(){
  $('#modal_p1').hide();
    $('.chart_img_bt1, .chart_img1').click(function(){
      $('#modal_p1').stop().fadeIn(300);
        $('#modal_p1 > .popup_bg , .close_bt').click(function(){
          $('#modal_p1').fadeOut(300);
        })
    });
})

/*Seechart*/

$(document).ready(function(){
function bannerset(bn,dir){
    if(dir=='right'){
        var variable_width = $(".panel1").width();
        $('.slide1 .dot1 li.on').removeClass('on');
        $('.slide1 .dot1 li:eq('+bn+')').addClass('on');
        $('.slide1 .panel1 li:eq('+bn+')').show();
        $('.slide1 .panel1 li:eq('+bn+')').css('top',variable_width+"px").fadeIn();
        $('.slide1 .panel1 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide1 .panel1 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }else{
        var variable_width = $(".panel1").width();
        $('.slide1 .dot1 li.on').removeClass('on');
        $('.slide1 .dot1 li:eq('+bn+')').addClass('on');
        $('.slide1 .panel1 li:eq('+bn+')').show();
        $('.slide1 .panel1 li:eq('+bn+')').css('top',"-"+variable_width+"px").fadeIn();
        $('.slide1 .panel1 li.on').fadeOut(function(){
            $(this).hide();
            $(this).removeClass('on');
        })
        $('.slide1 .panel1 li:eq('+bn+')').animate({'top':'0'},300,function(){
            $(this).addClass('on');
        })
    }
}

$(document).ready(function(){
    $('.slide1 .panel1 li:gt(0)').hide();
    //동그라미 버튼 클릭했을 때
    $('.slide1 .dot1 li').on('click',function(e){
        e.preventDefault();
        if($('.slide1 .panel1 li.on').is(':animated')==false){
            var num = $(this).index();
            var currentNum = $('.slide1 .dot1 li.on').index();
            if(num > currentNum){
                bannerset(num,'right')
            }else if(num < currentNum){
                bannerset(num,'left')
            }
        }

    })
    //이전버튼
    $('.arrow_area .prev1').on('click',function(e){
        e.preventDefault();
        if($('.slide1 .panel1 li.on').is(':animated')==false){
            var currentNum = $('.slide1 .dot1 li.on').index();
            var num = currentNum-1;
            if(num<0){
                num = $('.dot1 li').length-1;
            }
            bannerset(num,'right')
        }
    })
    //다음버튼
    $('.arrow_area .next1').on('click',function(e){
        e.preventDefault();
        if($('.slide1 .panel1 li.on').is(':animated')==false){
            var currentNum = $('.slide1 .dot1 li.on').index();
            var num = currentNum+1;
            if(num>$('.dot1 li').length-1){
                num = 0;
            }
            bannerset(num,'left')
        }
    })

})

});
