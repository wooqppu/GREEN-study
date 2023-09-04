select mem.userid, userpw, username, enabled, regidate, updatedate, auth
		from tbl_member mem left outer join tbl_member_auth auth 
		on mem.userid = auth.userid
		where mem.userid = 'user5';
