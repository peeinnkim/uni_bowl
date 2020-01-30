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

select * from t_program;

select *
from t_rsv rsv 
join t_rsv_seat_info using(i_rsv) 
join t_seat st using(i_seat) 
join t_seat_grade sg using(i_seatGrade)
join t_member mem using(i_member)
join t_pay py using(i_rsv);

select * from t_org;
select * from t_rsv;
select * from t_rsv_seat_info;
select * from t_seat where st_isRsved = 1;
select * from t_pay;


select * from t_rsv rsv
	right join t_rsv_seat_info using(i_rsv) 
	join t_org using(i_org)
	join t_program using(i_program)
	join t_theater using(i_theater)
	join t_seat using(i_seat)
	join t_pay using(i_rsv)
	join t_member mem on rsv.i_member = mem.i_member;

select count(*) from t_theater join t_seat using(i_theater) where i_theater = 2 and st_isRsved = 1;

select * from t_theater;

select count(*) from t_org org 
	join t_theater th using(i_theater)
	join t_program pg using(i_program)
	join t_rsv rsv using(i_org)
	order by i_theater asc, org.org_date asc;


select * from t_rsv_info ri 
	join t_rsv rsv using(i_rsv)
	join t_org org using(i_org) join t_theater th using(i_theater) join t_program pg using(i_program)
	join t_seat st using(i_seat)
	join t_pay pay using(i_rsv)
	join t_member mem on rsv.i_member = mem.i_member
	order by i_rsv desc;


delete from t_rsv_info where i_rsv = 3;
delete from t_pay where i_rsv = 3;
delete from t_Rsv where i_rsv=3;


select * from t_seat join t_rsv_info using(i_seat) where i_theater = 1 order by i_seat asc;

select * from t_seat left join t_rsv_info using(i_seat) where i_theater = 1 and (i_org is null or i_org = 4) order by i_seat asc;

select st.i_seat, st.st_nm, st.i_theater, st.i_seatGrade, org.i_org, org.org_date
from t_org org join t_seat st using(i_theater) 
where org.i_theater = 1 and org.i_org = 4 order by i_seat asc;

select st.*, org.i_org, ri.i_org 
from t_seat st left join t_rsv_info ri using(i_seat) 
join t_org org on org.i_theater = st.i_theater
where ri.i_org = 5
order by st.i_seat asc;

select * from t_org
	order by i_theater asc, org_date asc;

select * from t_theater;
select * from t_seat;

select * from t_org org 
		join t_theater th using(i_theater)
	join t_program pg using(i_program)
	where org.org_date = DATE(curdate())
order by org.i_program asc, org.org_sTime asc;

select count(i_program) from t_org org 
	join t_program pg using(i_program)
	where org.org_date = DATE(curdate())
group by i_program
order by org.i_theater asc, org.org_sTime asc;

select * from t_rsv rsv 
		join t_rsv_info ri using(i_rsv)
		join t_org org using(i_org)
		join t_theater th using(i_theater)
		join t_program pg using(i_program)
		join t_pay py on rsv.i_rsv = py.i_rsv 
where rsv.i_member = 1 and org.org_date >= '2020-01-21'
group by rsv.i_rsv;

select * from t_rsv rsv 
		left join t_rsv_info ri using(i_rsv)
		left join t_org org using(i_org)
		join t_theater th using(i_theater)
		join t_program pg using(i_program)
		left join t_pay py on rsv.i_rsv = py.i_rsv 
where rsv.i_member = 1;


select * from t_rsv rsv join t_rsv_info ri using(i_rsv) join t_org org using(i_org) join t_theater 
th using(i_theater) join t_program pg using(i_program) join t_pay py on rsv.i_rsv = py.i_rsv 
where rsv.i_member = 1 and org.org_date >= DATE(curdate()) group by rsv.i_rsv order by rsv.i_rsv 
desc;

select st_nm from t_rsv_info join t_seat using(i_seat) where i_rsv = 2;

select * from t_org where i_theater = 2;

select st.*, ri.i_rsv 
	from t_seat st left outer join t_rsv_info ri using(i_seat) 
	where i_theater = 1
order by i_seat asc;

select * from t_seat left join t_rsv_info using(i_seat) 
where i_theater = 1 order by i_seat asc;

select * from t_seat join t_rsv_info using(i_seat) where i_theater = 3 and i_org = 5
union
select * from t_seat left join t_rsv_info using(i_seat) where i_theater = 3 and i_org is null
order by i_seat asc;

select 
	*
from t_seat A
left join t_rsv_info B
on A.i_seat = B.i_seat
and B.i_org = 10
where A.i_theater = 2
order by A.i_seat asc;

select * from t_seat where i_theater = 1;

select * from t_seat join t_rsv_info using(i_seat) where i_theater = 1 and i_org = 12 union 
select * from t_seat left join t_rsv_info using(i_seat) where i_theater = 1 and i_org is null 
order by i_seat asc;

select * from t_member;
select count(*) from t_org where i_theater=1;
select * from t_theater;
select * from t_seat;

select count(*) from t_rsv_info where i_org = 10; -- 결과값이 0보다 크면 예약이 있는 프로그램임
select * from t_rsv_info join t_seat using(i_seat) where i_theater = 3; -- 결과값이 0보다 크면 예약이 있는 상영관임

select * from t_seat;

select count(qna_category) from t_qna group by qna_category;

select * from t_seat st left join t_rsv_info ri on st.i_seat = ri.i_seat and ri.i_org = 7 where 
st.i_theater = 3 order by st.i_seat asc; 
select * from t_pay;

-- 매출
select sum(py_price) from t_pay where year(py_date) = 2020 group by month(py_date);

select * from t_pay;
update t_pay set py_date = '2020-02-05 03:05:02' where i_pay = 10;

select * from t_qna;
select * from t_reply_qna;

select * from t_rsv;

select * from t_rsv_logs order by rl_rsvState desc, rl_rsvDate desc;

		select * from t_org org 
				join t_theater th using(i_theater)
				join t_program pg using(i_program)
				where org.org_date = '2020-01-30'
			order by org.i_program asc, org.org_sTime asc;

select * from t_program order by pg_isRunning asc;

select * from t_member order by m_quitDate asc, i_member desc;

select * from t_rsv_logs;
select * from t_pay;
update t_pay set py_date = '2019-08-04 08:03:02' where i_pay = 14;

select count(*) from t_org where i_program = 3;

select * from t_qna;

select * from t_member;

insert into t_member values
(0, "eiei3434", "eiei3434", "김이이", "1992-06-04", "010-3434-7006", "eieei@asdf.com", now(), null, 0),
(0, "okok3434", "okok3434", "이삼이", "1983-07-04", "010-7878-7686", "okwok@asdf.com", now(), null, 2),
(0, "nknk3434", "nknk3434", "김사이", "1993-02-12", "010-3634-7006", "neknk@asdf.com", now(), null, 0),
(0, "hlhl3434", "hlhl3434", "이오이", "1998-05-04", "010-3434-7600", "h3lhl@asdf.com", now(), null, 0),
(0, "iouo3434", "iouo3434", "김육이", "1993-11-05", "010-3454-7686", "ioeyt@asdf.com", now(), null, 0),
(0, "fgrg3434", "fgrg3434", "윤칠이", "1993-06-04", "010-3404-7006", "t2yrw@asdf.com", now(), null, 0),
(0, "fhfh5656", "fhfh5656", "김팔이", "1993-05-04", "010-3454-7686", "rtes@asdf.com", now(), null, 0),
(0, "hhjy5656", "hhjy5656", "오구이", "1999-05-04", "010-3534-7686", "sfgd@asdf.com", now(), null, 0),
(0, "gjgj5656", "gjgj5656", "김십이", "1993-04-14", "010-3434-7686", "ret34ed@asdf.com", now(), null, 2),
(0, "ghgg4545", "ghgg4545", "김일이", "1972-03-08", "010-3434-7686", "hjgf@asdf.com", now(), null, 0),
(0, "ghgh5654", "ghgh5654", "이이일", "1993-05-24", "010-3434-7686", "gfgrd@asdf.com", now(), null, 0),
(0, "vvvb3345", "vvvb3345", "박이임", "1994-02-04", "010-3454-7086", "dfsgd@asdf.com", now(), null, 0),
(0, "iiit5434", "iiit5434", "박이샴", "1992-09-24", "010-3404-7676", "teesre@asdf.com", now(), null, 0),
(0, "ghf453gg", "ghf453gg", "이이울", "1993-10-04", "010-3534-7686", "dfsed@asdf.com", now(), null, 0);

select * from t_rsv;

select * from t_qna;
select * from t_qna_attach;

insert into t_qna(qna_title,i_member,qna_content,qna_category) 
(select qna_title,i_member,qna_content,qna_category from t_qna)


select * from t_member;
update t_qna set i_member = 8 where i_qna = 5;

select * from t_pay order by py_date desc;

select month(py_date), sum(py_price)
from t_pay
where year(py_date) = 2019
group by month(py_date) order by py_date asc;

select * from t_program;
