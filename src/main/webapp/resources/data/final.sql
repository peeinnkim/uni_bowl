use uni_bowl;

select * from t_member where m_nm like '%믜믜%';

select * from t_member where m_code != 2;

select * from t_notice;
select * from t_notice_attach;

insert into t_notice(nt_title, nt_content, nt_isFixed) values("타이틀", "내용", 0);
insert into t_notice_attach(na_thumb, na_origin, i_notice) values();

select * from t_notice join t_notice_attach using(i_notice);

update t_notice set nt_title = ?, nt_content = ?, nt_isFixed = ?, nt_modDate = now()
	where i_notice = ?;

delete from t_notice;
delete from t_notice_attach;

delete from t_program where i_program = 6;
select * from t_program;

select * from t_notice;

select * from t_qna;

select m.i_member, m.m_id, qna.*, qa.*
	from t_qna qna left join t_member m using(i_member)
	left join t_qna_attach qa using(i_qna)
	order by qna.i_qna;

select * from t_qna_attach;


select m.i_member, m.m_id, rp.* from t_reply_qna rp join t_member m using(i_member) where i_qna = 3;

select * from t_member;

-- 예약 한건을 위해 이렇게 많은 테이블을 조인해야해요
select * from t_org org 
		join t_org_detail dt using(i_org) 
		join t_program pg using(i_program)
		join t_theater th using(i_theater);

select * from t_org join t_program using(i_program);

select * from t_theater;





