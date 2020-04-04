$(".nav-link").click(function(){ 
   const selected=this.id.substring(1);
   const area = $("#"+selected);
   $(".tab-pane").not(area).removeClass("active");
   $("#"+selected).toggleClass("active");
});