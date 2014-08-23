select = '#question' + <%= @question.id %>;
$(select + "> .box").addClass('correct');
$(select + "> .box > .alternatives").toggle("slow")

gon.score = gon.score + 3
gon.answers_count += 1


$('#score').html(gon.score)