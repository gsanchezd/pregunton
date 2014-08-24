select = "#question" + <%= @question.id %>;
$(select + "> .box").addClass "wrong"
$(select + "> .box > .alternatives").toggle "slow"
gon.answers_count += 1
gon.score -= 3

update_scores()