var post = $('#form_submit');
var like = $('.like_icon');
var reply = $('.reply_icon');
var textarea = $("#textarea");
var comment = $("#comment");
var result ="";
var comment_user = $(".comment_nick");
var nick = $("#nick");
function traverseNode(reply){
    result += "<article class=\"r_"+ reply['id']+" media\">";
    result += "<figure class=\"avatars media-left\">";
    result += "<p class=\"round_icon_small\">";
    result += "<img src=\"" + reply['avatars_url']+"\">";
    result += "</p>";
    result += "</figure>";
    result += "<div class=\"comment media-content\">";
    result += "<div class=\"comment_content\" style=\"font-size: 17px;\">";
    result += "<strong class=\"comment_nick\" >"+ reply['user'] +"</strong><br>";
    result +=   reply['data']+"<br>";
    result += "<div class=\"level\">";
    result += "<div class=\"level-left\">";
    result += "<span class=\"icon is_small detail-meta-item-icon\">";
    result += "<a><i class=\"fa fa-thumbs-up like_icon\" ></i></a></span>";
    result += "<span class=\"icon is_small detail-meta-item-icon\">\n" +
        "      <a href=\"#textarea\" onclick='reply_func(this)'><i class=\"fa fa-reply reply_icon\"></i></a>\n" +
        "      </span></div>";
    result += "<div class=\"level_right\">\n" +
        "      <span class=\"comment_post_time\">\n" +
                 reply['comment_time'] + "\n" +
        "       </span>\n" +
        "       </div>\n" +
        "       </div>\n" +
        "       </div>";
    result += "</article>";
}

function traverseTree(node){
    if (!node) {
        return;
    }
    traverseNode(node);

    if (node.children && node.children.length > 0) {
    var i = 0;
    for (i = 0; i < node.children.length; i++) {
        this.traverseTree(node.children[i]);
    }

    }

}

reply_func = function(dom){
    var index = $(dom).parents('.level').prevAll('.comment_nick').text();
    console.log(index);
    var comment_parent_id = $(dom).parents(".media").attr('class').split(" ")[0].split("_")[1];
    console.log(comment_parent_id);
    if(document.getElementById("comment_id"))
    {
        $("#comment_id").attr("value",comment_parent_id)
    }else{
        $("#post").append('<input name="comment_id" value="'+ comment_parent_id + '"' + ' type="hidden" id="comment_id">');
    }
   textarea.val("@" + index + ":");
    };

$(document).ready(function () {
    post.click(function () {
        $.ajax({
            type:"post",
            url:"/comment/post/",
            data:{
                "post_id":$("#post_id").val(),
                "nick":nick.val(),
                "comment":$("#textarea").val(),
                "comment_parent_id":$("#comment_id").val()

            },
            dataType:"json",
            async:false,
            success:function (data) {
                if(data["status"]){
                    alert(data["msg"]);
                    window.location.reload();
                }
                else {
                    alert(data["msg"]);
                    window.location.reload();
                }
            }
        })
    });


    window.onload = function (){
      $.ajax({
        type:"get",
        url:"/comment/post/",
        data:{
            "post_id":$("#post_id").val(),
        },
        dataType:"json",
            async:false,
            success:function (data) {
                var comment_data = data['children'];
                for (var i=0;i<comment_data.length;i++){
                    result += "<article class=\"c_"+ comment_data[i]['id']+" media\">";
                    result += "<figure class=\"avatars media-left\">";
                    result += "<p class=\"round_icon\">";
                    result += "<img src=\"" + comment_data[i]['avatars_url']+"\">";
                    result += "</p>";
                    result += "</figure>";
                    result += "<div class=\"comment media-content\">";
                    result += "<div class=\"comment_content\" style=\"font-size: 17px;\">";
                    result += "<strong class=\"comment_nick\" >"+ comment_data[i]['user'] +"</strong><br>";
                    result += comment_data[i]['data']+"<br>";
                    result += "<div class=\"level\">";
                    result += "<div class=\"level-left\">";
                    result += "<span class=\"icon is_small detail-meta-item-icon\">";
                    result += "<a><i class=\"fa fa-thumbs-up like_icon\" ></i></a></span>";
                    result += "<span class=\"icon is_small detail-meta-item-icon\">\n" +
                        "      <a href=\"#textarea\" onclick='reply_func(this)'><i class=\"fa fa-reply reply_icon\"></i></a>\n" +
                        "      </span></div>";
                    result += "<div class=\"level_right\">\n" +
                        "      <span class=\"comment_post_time\">\n" +
                                 comment_data[i]['comment_time'] + "\n" +
                        "       </span>\n" +
                        "       </div>\n" +
                        "       </div>\n" +
                        "       </div>";
                    var reply = comment_data[i]["children"];
                    for (var j = 0;j < reply.length;j++){
                        traverseTree(reply[j])
                    }
                    result += "</div>";
                    result +="</article>";
                    }


                    comment.prepend(result);
        }
      })
    }
});

// function replyon(nick,comment_id) {
//     var data = {
//         "nick":nick,
//         "comment_id":comment_id,
//         "post_id":$("#post_id").val(),
//         "comment":$("#textarea").val(),
//
//     };
//     textarea.val("@" + nick + " ");
//     console.log(textarea.val());
//
// }

