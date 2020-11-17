$(document).ready(function () {
    var headClix = 0,eyeClix = 0,
        noseClix = 0,mouthClix = 0;
    lightning_one();
    lightning_two();
    lightning_three();

    $(" #container #head").click(function () {
        if(headClix < 9)
        {
            $(" #container #head").animate({left:"-=367px"},500);
            headClix  +=1;
        }else{
            $("#container #head").animate({left:"0px"},500);
            headClix = 0;
        }
    });
    $("#eye").click(function () {
        if (eyeClix<9){
            $("#eye").animate({left:"-=367px"},500);
            eyeClix +=1;
        }else{
            $("#eye").animate({left:"0px"},500);
            eyeClix = 0;
        }
    });
    $("#nose").click(function () {
        if(noseClix<9){
            $("#nose").animate({left:"-=367px"},500);
            noseClix += 1;
        }else{
            $("#nose").animate({left:"0px"},500);
            noseClix = 0;
        }
    });
    $("#mouth").click(function () {
            if(mouthClix<9){
                $("#mouth").animate({left:"-=367px"});
                mouthClix += 1;
            }else{
                $("#mouth").animate({left:"0px"},500);
                mouthClix = 0;
            }
        });
        });
function lightning_one(){
    $("#container #lighting1").fadeIn(250).fadeOut(250);
    setTimeout("lightning_one()",4000);
};
function lightning_two(){
    $("#container #lighting2").fadeIn(250).fadeOut(250);
    setTimeout("lightning_two()",5000);
};
function lightning_three(){
    $("#container #lighting3").fadeIn(250).fadeOut(250);
    setTimeout("lightning_three()", 6000);
};
