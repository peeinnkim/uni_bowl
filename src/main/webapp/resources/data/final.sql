use uni_bowl;

select * from t_member;

select * from t_notice;
select * from t_notice_attach;

insert into t_notice(nt_title, nt_content, nt_isFixed) values("타이틀", "내용", 0);
insert into t_notice_attach(na_thumb, na_origin, i_notice) values();

select * from t_notice join t_notice_attach using(i_notice);

update t_notice set nt_title = ?, nt_content = ?, nt_isFixed = ?, nt_modDate = now()
	where i_notice = ?;

delete from t_notice where i_notice=?;
delete from t_notice_attach where i_notice=?