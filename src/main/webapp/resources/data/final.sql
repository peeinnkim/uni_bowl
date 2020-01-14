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

-- 오늘 예약 보기
select * from t_org org 
	join t_theater th using(i_theater)
	join t_program pg using(i_program)
	where DATE(org.org_date) = DATE(curdate())
	order by org.org_date asc;

select * from t_org join t_program using(i_program);

select * from t_theater;
select * from t_seat;
select * from t_seat_grade;

delete from t_seat_grade;

select * from t_seat order by st_nm *1 asc;
select * from t_seat order by i_seat asc;


show variables like 'max_allowed_packet'; 

select * from t_qna_attach;

select m.i_member, m.m_id, qna.i_qna, qna.qna_title, qna.qna_content, qna.qna_category, 
	   qna.qna_regDate, qna.qna_modDate, qna.qna_viewCnt, qa.i_attach, qa.qa_thumb, qa.qa_origin
	from t_qna qna 
		left join t_member m using(i_member) 
		left join t_qna_attach qa using(i_qna) 
	where qna_title like CONCAT('%', '이', '%') order by i_qna desc;

select th_row, th_col from t_theater where i_theater = 1;

select * from t_seat where i_theater = 2 order by i_seat asc;

select * from t_notice;


select * from (
	select *, 1 sort from t_notice where nt_isFixed = 1
	union all
	select *, 2 sort from t_notice
) sNt; 
order by sNt.sort asc, i_notice desc;

