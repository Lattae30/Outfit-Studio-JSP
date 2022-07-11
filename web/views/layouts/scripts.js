<script>
var myIndex = 0;
slidebar();

function slidebar(){
    var i;
    var x = document.getElementsByClassName("card-image");
    for(i = 0; i < x.length; i++){
        x[i].style.display = "none";
    }

    myIndex++;
    if(myIndex > x.length){
        myIndex = 1;
    }
    x[myIndex-1].style.display = "block";
    setTimeout(slidebar, 2500);
}
</script>
