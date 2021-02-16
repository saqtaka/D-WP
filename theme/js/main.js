
// 即時関数に入れて変数のスコープを限定的にする
(() => {

    'use strict';

    var container = document.querySelector('#post-content');

    // 記事ページのみで使用
    if ( container ) {


        var postH2 = container.querySelectorAll("h2");
        var postH3 = container.querySelectorAll("h3");
        var postH4 = container.querySelectorAll("h4");
        var postH5 = container.querySelectorAll("h5");
        var postH6 = container.querySelectorAll("h6");
        var postPre = container.querySelectorAll("Pre");
    
        //console.log('test');
    
    
    
        if (postH2) {
            postH2.forEach(el => {
    
                //console.log(el.classList);
                el.classList.add('mt-5');
                el.classList.add('mb-2');
                //console.log(el.classList);
            });
    
        }
    
        if (postH3) {
    
            postH3.forEach(el => {
    
                //console.log(el.classList);
                el.classList.add('mt-5');
                el.classList.add('mb-2');
                //console.log(el.classList);
            });
    
        }
    
        if (postH4) {
    
            postH4.forEach(el => {
    
                //console.log(el.classList);
                el.classList.add('mt-5');
                el.classList.add('mb-2');
                //console.log(el.classList);
            });
        }
    
        if (postH5) {
    
            postH5.forEach(el => {
    
                //console.log(el.classList);
                el.classList.add('mt-5');
                el.classList.add('mb-2');
                //console.log(el.classList);
            });
    
        }
    
        if (postH6) {
            
            postH6.forEach(el => {
    
                //console.log(el.classList);
                el.classList.add('mt-5');
                el.classList.add('mb-2');
                //console.log(el.classList);
            });
    
        }
    
        if (postPre) {
            
            postPre.forEach(el => {
    
                //console.log(el.classList);
                el.classList.add('m-4');
                el.classList.add('p-4');
                //console.log(el.classList);
            });
    
        }

    }



})();
