/**
 * 패스포트 라우팅 함수 정의
 *
 * @date 2016-11-10
 * @author Mike
 */
  

module.exports = function(router, passport, upload, pool, paging) {
    console.log('user_passport 호출됨.');

    
    
    
    
    router.route('/download/:no').get(function(req, res){
                
        var no = Number(req.params.no);
        
        console.log('123123' + no);
        
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('select * from 파일 where 공지사항번호=?',no,function(err,rows){
                    conn.release();
                    
                    
                    if(rows.length > 0){
                        res.download('/Users/hwang-il-yeong/Downloads/DataBaseReport2/'+ rows[0].파일경로, rows[0].변경이름);
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
            });
            
        
    });
    
    
    
    // 정렬 구간
    
    router.route('/wakesort').get(function(req,res){
        console.log('/wakesort 호출됨');
        
        var no = req.query.no;
        var page = req.query.page;
        var perpagenum = req.query.perpage;
    
        
        if(no == 1){
            no = '잔반일자';
        } else if(no == 2){
            no = '잔반량';
        } 
        
        console.log( no +page + perpagenum);
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                conn.query('select count(*) as totalCount from 잔반',function(err, rows){
                    
                    var context = paging.add(page,perpagenum,rows[0].totalCount);
                    console.log(no);
                    conn.query('select  잔반번호, date_format(잔반일자,"%Y-%m-%d") as 잔반일자, 잔반량, 식사시간, 담당자 from 잔반 where 잔반번호 > 0 order by ?? desc limit ?,?;',[no,context.startpage,Number(perpagenum)],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('wakelist',{rows: rows, context: context});    
                        
                    } else {
                        console.log('데이터 못찾음' + err);
                    }
                    });
                });
            });
            
        }
    });
    
    router.route('/suppsort').get(function(req,res){
        console.log('/suppsort 호출됨');
        
        var no = req.query.no;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        
        if(no == 1){
            no = 'supplier_name';
        } else if(no == 2) {
            no = 'supplier_date';
        }
        
        
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                conn.query('select count(*) as totalCount from supplier',function(err, rows){
                    
                var context = paging.add(page,perpagenum,rows[0].totalCount);
                conn.query('select * from supplier order by ?? asc limit ?,?',[no,context.startpage,Number(perpagenum)],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('supplier',{rows: rows, context: context});    
                    } else {
                        console.log('데이터 못찾음' + err);
                    }
                });
                });
            });
            
        }
    });
    
    router.route('/foodsort').get(function(req,res){
        console.log('/foodsort 호출됨');
        
        
        var no = req.query.no;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        if(no == 1){
            no = 'food_deldate';
        } else if(no == 2){
            no ='food_inven';
        } else if(no == 3){
            no = 'food_distrdate';
        }
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                conn.query('select count(*) as totalCount from food',function(err, rows){
                    
                var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                conn.query('select food_no,food_name,food_supplier,food_origin,food_price,food_inven,food_delcount, date_format(food_deldate,"%Y-%m-%d") as food_deldate, date_format(food_distrdate,"%Y-%m-%d") as food_distrdate, date_format(food_update,"%Y-%m-%d") as food_update from food order by ?? desc limit ?,?;',[no,context.startpage,Number(perpagenum)],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('food',{rows: rows, context: context});    
                    } else {
                        console.log('데이터 못찾음' + err);
                    }
                });
                });
            });
            
        }
        
    });
    
    
    
    router.route('/noticedel').get(function(req,res){
       console.log('/noticedel 호출됨');
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        
        console.log(page + perpagenum);
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                conn.query('delete from 파일 where 공지사항번호 = ?',id,function(err,rows){
                    conn.query('delete from 공지사항 where 번호 = ?',id,function(err,rows){
                    conn.release();
                    
                    if(!err){
                        res.redirect('/noticelist?page='+page+"&perpagenum="+perpagenum);    
                    } else {
                        console.log('데이터 삭제 실패' + err);
                        
                    }
                    });
                });
            });
            
        }
    
        
    });
    
    
    router.route('/noticeinfo').get(function(req, res){
       console.log('noticeinfo 호출됨');
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        console.log(id + page + perpagenum);
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        if(!req.user){
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('select 번호, 제목, 내용, 작성자, 파일경로, 파일이름, 공지사항번호 from 공지사항 join 파일 on 공지사항.번호=파일.공지사항번호 where 번호=?',id,function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('noticeinfo',{rows: rows[0], context: context, login_success:false});    
                    } else {
                        console.log('데이터 못찾음' + err);
                    }
                    
                });
            });
                        
        } else {
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('select 번호, 제목, 내용, 작성자, 파일경로, 파일이름, 공지사항번호 from 공지사항 join 파일 on 공지사항.번호=파일.공지사항번호  where 번호=?',id,function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('noticeinfo',{rows: rows[0], context:context, login_success:true});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
            });   
        }
    });
    
    router.route('/noticeupdate').post(upload.array('photo',1),function(req,res){
       console.log('/noticeedit 호출됨');
        
       var body = req.body;
        
        var files = req.files;
        
        var filepath = files[0].path;
        var name = files[0].originalname;
        var filename = files[0].filename;
        
        
        
        if(!req.user){
            console.log('사용자 인증 안된 상태임');
            res.redirect('/');
        } else {
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                
                var from = "공지사항";
                conn.query('update ?? set 제목=?, 내용=? where 번호=?',[from, body.title, body.content, body.no],function(err, rows){
                    
                conn.release();
                if(err){
                    console.log('데이터 변경 실패' + err);
                } else {
                    res.redirect('noticelist?page='+body.page+"&perpagenum="+body.perpagenum);
                }
                    
            });
            });
        }
        
    });
    
    router.route('/noticeedit').get(function(req,res){
       console.log('/noticeedit 호출됨');
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('select * from 공지사항 where 번호=?',id,function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('noticeedit',{rows: rows[0],context:context});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
            });
            
        }
        
    });

    
    router.route('/noticeadd').post(upload.array('photo',1),function(req,res){
       console.log('/noticeadd 호출됨');
        
        
        var title = req.body.title || req.query.title;
        var content = req.body.content || req.query.content;
        var writer = req.body.writer || req.query.writer;
        
        var page = req.body.page || req.query.page;
        var perpagenum = req.body.perpagenum || req.query.perpagenum;
        
        var files = req.files;
        
        console.log(files);
        
        
        var filepath = files[0].path; // 파일경로
        var name = files[0].originalname; // 파일이름
        var filename = files[0].filename; // 변경된파일이름
        console.log(filepath);
        
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var data = {번호:null, 제목:title, 내용:content, 작성자:writer, 작성일자:null};
                
                conn.query('insert into 공지사항 set ?',[data],function(err,rows){
                    
                    var files = {변경이름: filename, 파일이름: name, 파일경로: filepath, 공지사항번호: rows.insertId, 등록일자:null,식단번호:null};
                    conn.query('insert into 파일 set ?',[files],function(err,rows1){
                    
                    conn.release();
                     
                    if(err){
                        console.log('데이터 저장실패');
                    } else {
                        res.redirect('noticelist?page='+page+"&perpagenum="+perpagenum);
                    }
                    });
                });
            });   
        }
        
    });
    
    router.route('/noticeadd').get(function(req,res){
       console.log('/tendlist 호출됨');
        
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        res.render('noticeadd', {context: context,user: req.user[0]});
        
        
    });
    
    router.route('/noticelist').get(function(req,res){
       console.log('/tendlist 호출됨');
        
        
        var page = parseInt(req.query.page); // 현재 페이지 번호
        var perpagenum = parseInt(req.query.perpagenum); // 화면에 출력될 페이지수
        
        
            console.log(typeof(perpagenum));
        
        
        if(!req.user){
            
            console.log('사용자 인증 안된상태');
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                exec = conn.query('select count(*) as totalCount from 공지사항 ',function(err,rows){
                    
                var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                exec = conn.query('select 번호, 제목, 작성자, date_format(작성일자,"%Y-%m-%d") as 작성일자 from 공지사항 where 번호 > 0 limit ?, ? ',[context.startpage,perpagenum],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('noticelist', {rows: rows, context: context, login_success:false});  
                    } else {
                        console.log('데이터 못찾음');
                    }
                });
                });
            });
            
        } else {
            
            
            console.log('사용자 인증 안된상태');
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                exec = conn.query('select count(*) as totalCount from 공지사항 ',function(err,rows){
                    
                var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                exec = conn.query('select 번호, 제목, 작성자, date_format(작성일자,"%Y-%m-%d") as 작성일자 from 공지사항 where 번호 > 0 limit ?, ? ',[context.startpage,perpagenum],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('noticelist', {rows: rows, context: context, login_success:true});  
                    } else {
                        console.log('데이터 못찾음');
                    }
                });
                });
            });
        }
        
    });
    
    
    
    router.route('/tendinfo').get(function(req,res){
       console.log('/tendinfo 호출됨');
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context = {
            page : page,
            perpage : perpagenum
        }
        
        console.log(page + "," + id);
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('select 번호, 제목, 내용, 작성자 from 게시판 where 번호=?',id,function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('tendinfo',{rows: rows[0], context: context, login_success:false});
                    } else {
                        console.log('데이터 못찾음');
                    }
                });
            });
            
            
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('select 번호, 제목, 내용, 작성자 from 게시판 where 번호=?',id,function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('tendinfo',{rows: rows[0],context:context, login_success:true});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
            });
            
        }
        
    });
    
    
    router.route('/tendpw').post(function(req,res){
        
        var body = req.body;
        var page = req.body.page;
        var perpage = req.body.perpage;
        
        var context = {
            page : page,
            perpage : perpage
        }
        
        if(!req.user){
            
        pool.getConnection(function(err,conn){
            if(err){
                if(conn){
                    conn.release();
                }
            console.log('에러가 발생하였습니다.' + err);
            }
            var exec = conn.query('select * from 게시판 where 작성자=? and 비밀번호=?',[body.writer, body.passwd],function(err,rows){
                conn.release();
                if(rows.length > 0){
                    res.render('tendedit',{rows: rows[0], context: context, login_success:false});   
                } else {
                    console.log('asf');
                }
                    
            });
        });
            
        } else {
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('select * from 게시판 where 작성자=? and 비밀번호=?',[body.writer, body.passwd],function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('tendedit',{rows: rows[0], login_success:true});  
                    } else {
                        console.log('비밀번호가 틀립니다.');  
                    }
                    
                });
            });  
        }
    });
    
    
    router.route('/tenddel').post(function(req,res){
       console.log('/tendlist 호출됨');
        
        var body = req.body;
        var page = req.body.page;
        var perpage = req.body.perpage;
        
        
        console.log('???'+body.passwd+ body.writer);
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('delete from 게시판 where 작성자=? and 비밀번호=?',[body.writer, body.passwd],function(err,rows){
                    conn.release();
                    console.dir(rows);
                    if(rows.affectedRows > 0){
                        res.redirect('tendlist?page='+page+"&perpagenum="+perpage);    
                    } else {
                        res.redirect('tendlist?page='+page+"&perpagenum="+perpage+"&id="+body.no);
                        
                    }
                    
                });
            });
            
            
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var exec = conn.query('delete from 게시판 where 작성자=?, 비밀번호=?',[body.writer, body.passwd],function(err,rows){
                    conn.release();
                    if(!err){
                        res.redirect('/tendlist');    
                    } else {
                        console.log('데이터 삭제 실패');
                    }
                    
                });
            });
            
        }
    });
    
    
    
    router.route('/tendupdate').post(function(req,res){
       console.log('/tendupdate 호출됨');
        
        var body = req.body;
        var page = req.body.page;
        var perpage = req.body.perpage;
        
        
        if(!req.user){
            console.log('사용자 인증 안된 상태임');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                
                var from = "게시판";
                var exec = conn.query('update ?? set 제목=?, 내용=? where 번호=?',[from, body.title, body.content, body.no],function(err, rows){
                conn.release();
                if(!err){
                    res.redirect('tendlist?page='+page+"&"+"perpagenum="+perpage);
                } else {
                    console.log('데이터 변경 실패' + err);
                }
            });
            });
            
            
        } else {
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                
                var from = "게시판";
                var exec = conn.query('update ?? set 제목=?, 내용=? where 번호=?',[from, body.title, body.content, body.no],function(err, rows){
                conn.release();
                if(err){
                    console.log('데이터 변경 실패' + err);
                } else {
                    res.redirect('tendlist');
                }
            });
            });
        }
    });
    
    
    
    router.route('/tendadd').get(function(req,res){
        
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context ={
            page : page,
            perPage :  perpagenum
        }
        
        if(!req.user){
            res.render('tendadd',{context: context,login_success:false});
        } else {
            res.render('tendadd',{context: context,login_success:true});
        }
    });
    
    
    router.route('/tendadd').post(function(req,res){
       console.log('/tendadd 호출됨');
        
        var title = req.body.title || req.query.title;
        var content = req.body.content || req.query.content;
        var writer = req.body.writer || req.query.writer;
        var passwd = req.body.passwd || req.query.passwd;
        
        var page = req.body.page || req.query.page;
        var perpagenum = req.body.perpagenum || req.query.perpagenum;
        
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var data = {번호:null, 제목:title, 내용:content, 작성자:writer, 비밀번호:passwd, 작성일자:null};
                var exec = conn.query('insert into 게시판 set ?',data,function(err,rows){
                    conn.release();
                     
                    if(err){
                        console.log('데이터 저장실패');
                    } else {
                        res.redirect('tendlist?page='+page+"&perpagenum="+perpagenum);
                    }
                   
                });
            });  
            
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var data = {번호:null, 제목:title, 내용:content, 작성자:writer, 비밀번호:passwd, 작성일자:null};
                var exec = conn.query('insert into 게시판 set ?',data,function(err,rows){
                    conn.release();
                     
                    if(err){
                        console.log('데이터 저장실패');
                    } else {
                        res.redirect('tendlist');
                    }
                   
                });
            });   
        }
        
    });
    
    router.route('/tendlist').get(function(req,res){
        console.log('/tendlist 호출됨');
        
        if (!req.user) {
                
        var page = parseInt(req.query.page); // 현재 페이지 번호
        var perpagenum = parseInt(req.query.perpagenum); // 화면에 출력될 페이지수
        
        

        
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                conn.query('select count(*) as totalCount from 게시판',function(err, rows){
                    
                    
                    var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                    
                    conn.query('select 번호, 제목, 내용, 작성자, date_format(작성일자,"%Y-%m-%d") as 작성일자 from 게시판 where 번호 > 0 limit ?, ?',[context.startpage,perpagenum],function(err,rows){
                    conn.release();
                        
                    if(!err){
                        res.render('tendlist',{rows: rows, context: context, login_success:false});    
                    } else {
                        console.log('데이터 못찾음' + err);
                    }
                    
                });
                    
                });
            });
        } else {
            console.log('사용자 인증된 상태임.');
            
        
        
            var page = parseInt(req.query.page); // 현재 페이지 번호
            var perpagenum = parseInt(req.query.perpagenum); // 화면에 출력될 페이지수
        

        
        
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                conn.query('select count(*) as totalCount from 게시판',function(err, rows){
                    
                  var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                    conn.query('select * from 게시판 where 번호 > 0 limit ?, ?',[context.startpage,perpagenum],function(err,rows){
                    conn.release();
                        
                    if(!err){
                        res.render('tendlist',{rows: rows, context: context,login_success:true});    
                    } else {
                        console.log('데이터 못찾음' + err);
                    }
                    
                });
                    
                });
            });
            
        }
    });
    
    
    router.route('/ditedel/:id').get(function(req,res){
        console.log('/wakelist 호출됨');
        
    });
    
    router.route('/diteedit/:id').get(function(req,res){
        console.log('/wakelist 호출됨');
        
    });
    
    router.route('/diteadd').get(function(req,res){
        console.log('/diteadd 호출됨');
               
        var context = {
            today : String(req.query.date)
        }
        
        console.log(context.today);
        
        res.render('diteadd', {context: context, user: req.user[0],login_success:true});  
    });
    
    router.route('/ditelist').get(function(req,res, err){
        console.log('/wakelist 호출됨');
        
        
        if(!req.user){
            res.render('ditelist', {login_success:false});   
        } else {
            console.log(req.user[0].이름);
            res.render('ditelist', {user: req.user[0],login_success:true});   
        }        
    });
    
    
    
    router.route('/wakeupdate').post(function(req,res){
        console.log('/wakeupdate 호출됨');
        
        var body = req.body;
        
        if(!req.user){
            console.log('사용자 인증 안된 상태임');
            res.redirect('/');
        } else {
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                var from = "잔반";
                var exec = conn.query('update ?? set 잔반번호=?, 잔반일자=?, 잔반량=?, 식사시간=?, 담당자=? where 잔반번호=?',[from, body.no, body.date, body.count, body.time, body.manag, body.no],function(err, rows){
                conn.release();
                if(err){
                    console.log('데이터 변경 실패' + err);
                } else {
                    res.redirect('/wakelist?page='+body.page+"&perpagenum="+body.perpagenum);
                }
            });
            });
        }
        
    });
    
    router.route('/wakeedit').get(function(req,res){
        console.log('/wakeedit 호출됨');
        
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                
                var exec = conn.query('select  잔반번호, date_format(잔반일자,"%Y-%m-%d") as 잔반일자, 잔반량, 식사시간, 담당자 from 잔반 where 잔반번호=?',id,function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('wakeedit',{rows: rows[0],context: context});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
                
            });
        }
        
        
    });
    
    router.route('/wakedel').get(function(req,res){
        console.log('/wakedel 호출됨');
        
         var id = req.query.id;
         var page = req.query.page;
         var perpagenum = req.query.perpagenum;
        
        
        if(!req.user){
            console.log('사용자 인증 안된상태');
            res.redirect('/');
        } else {
            
            pool.getConnection(function(err,conn){
               if(err){
                   if(conn){
                       conn.release();
                   }
                console.log('에러가 발생하였습니다.');
               } 
                var exec = conn.query('delete from 잔반 where 잔반번호=?',id,function(err,rows){
                    conn.release();
                    if(err){
                        console.log('데이터 못찾음'); 
                    } else {
                        res.redirect('/wakelist?page='+page+"&perpagenum="+perpagenum);
                    }
                    
                });
                
            });
        }
        
        
    });
    
    
    router.route('/wakeadd').post(function(req,res){
        console.log('/wakeadd 호출됨');
        
        
        var page = req.body.page || req.query.page;
        var perpagenum = req.body.perpagenum || req.query.perpagenum;
        
        console.log(page + "," +perpagenum);
        
        var date = req.body.date || req.query.date;
        var count = Number(req.body.count || req.query.count);
        var time = req.body.time || req.query.time;
        var manag = req.body.manag || req.query.manag;
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var data = {잔반번호:null, 잔반일자:date, 잔반량:count, 식사시간:time, 담당자:manag};
                var exec = conn.query('insert into 잔반 set ?',data,function(err,rows){
                    conn.release();
                     
                    if(err){
                        console.log('데이터 저장실패' + err);
                    } else {
                        res.redirect('wakelist?page='+page+"&perpagenum="+perpagenum);
                    }
                   
                });
            });   
        }
        
    });
    
    router.route('/wakeadd').get(function(req,res){
        console.log('/wakeadd 호출됨');
        
        
        var page = req.query.page; // 현재 페이지 번호
        var perpagenum = req.query.perpagenum; // 화면에 출력될 페이지수
        
        
        console.log(page+"," + perpagenum);
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        if(!req.user){
            console.log('사용자 인증 안된상태');
            res.redirect('/');
        } else {
            res.render('wakeadd',{user: req.user[0], context : context});
        }
    });
    
    router.route('/wakelist').get(function(req,res){
        console.log('/wakelist 호출됨');
        
        
        var page = parseInt(req.query.page); // 현재 페이지 번호
        var perpagenum = parseInt(req.query.perpagenum); // 화면에 출력될 페이지수
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                    
                conn.query('select count(*) as totalCount from 잔반',function(err, rows){
                    
                    var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                    conn.query('select  잔반번호, date_format(잔반일자,"%Y-%m-%d") as 잔반일자, 잔반량, 식사시간, 담당자 from 잔반 where 잔반번호 > 0 limit ?,?',[context.startpage,perpagenum],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('wakelist',{rows: rows, context: context});    
                        
                    } else {
                        console.log('데이터 못찾음' + err);
                    }
                    });
                });
            });
            
        }
    });
    
    // 파일 업로드 라우팅 함수 - 로그인 후 세션 저장함
    router.route('/process/photo').post(upload.array('photo', 1), function(req, res) {
	   console.log('/process/photo 호출됨.');
	
        var dd = req.body;
        console.log(dd.dd);
        
        try {
            var files = req.files;
	
            console.dir('#===== 업로드된 첫번째 파일 정보 =====#')
            console.dir(req.files[0]);
            console.dir('#=====#')
        
            // 현재의 파일 정보를 저장할 변수 선언
           
		
		
        } catch(err) {
            console.dir(err.stack);
        }	
		
    });
    
    
    router.route('/suppupdate').post(function(req,res){
       console.log('suppupdate 패스 요청됨');
        
        var body = req.body;
        
        if(!req.user){
            console.log('사용자 인증 안된 상태임');
            res.redirect('/');
        } else {
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                var from = "supplier";
                var exec = conn.query('update ?? set supplier_name=?, supplier_phone=?, supplier_addr=?, supplier_getname=? where supplier_no=?',[from, body.name, body.phone, body.addr, body.manag, body.no],function(err, rows){
                conn.release();
                if(err){
                    console.log('데이터 변경 실패' + err);
                } else {
                    res.redirect('supplier?page='+body.page+"&perpagenum="+body.perpagenum);
                }
            });
            });
        }
    });
    
    router.route('/suppdel').get(function(req,res){
        console.log('suppdel 패스 요청됨');
        
        var id = req.query.id;
        
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        if(!req.user){
            console.log('사용자 인증 안된상태');
            res.redirect('/');
        } else {
            
            pool.getConnection(function(err,conn){
               if(err){
                   if(conn){
                       conn.release();
                   }
                console.log('에러가 발생하였습니다.');
               } 
                var exec = conn.query('delete from supplier where supplier_no=?',id,function(err,rows){
                    conn.release();
                    if(err){
                        console.log('데이터 못찾음'); 
                    } else {
                        res.redirect('/supplier?page='+page+"&perpagenum="+perpagenum);
                    }
                    
                });
                
            });
        }
    });
    
    router.route('/suppedit').get(function(req,res){
        console.log('suppedit 패스 요청됨');
        
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                
                var exec = conn.query('select * from supplier where supplier_no=?',id,function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        res.render('suppedit',{rows: rows[0],context: context});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
                
            });
        }
    });
    
    router.route('/suppadd').get(function(req,res){
        console.log('/suppadd get 패스 호출됨');
        
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context = {
            page : page,
            perPage: perpagenum
        }
        
        if(!req.user){
            console.log('사용자 인증 안된상태');
            res.redirect('/');
        } else {
            res.render('suppadd',{context: context});
        }
        
    });
    
    router.route('/suppadd').post(function(req,res){
        console.log('/suppadd post 패스 호출됨');
        
        console.log('asdf'+","+"???");
        
        var name = req.body.name || req.query.name;
        var phone = req.body.phone || req.query.phone;
        var addr = req.body.addr || req.query.addr;
        var manag = req.body.manag || req.query.manag;
        
        var page = req.body.page || req.query.page;
        var perpagenum = req.body.perpagenum || req.query.perpagenum;
        
        console.log(name + ',' + phone + ',' + addr + ',' + manag);
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var data = {supplier_no:null, supplier_name:name, supplier_phone:phone, supplier_addr:addr, supplier_getname:manag,supplier_date:null};
                var exec = conn.query('insert into supplier set ?',data,function(err,rows){
                    conn.release();
                     
                    if(err){
                        console.log('데이터 저장실패');
                    } else {
                        res.redirect('supplier?page='+page+"&perpagenum="+perpagenum);
                    }
                   
                });
            });   
        }
    });
    
    router.route('/supplier').get(function(req,res){
        console.log('supplier 패스 호출됨');
        
        var page = parseInt(req.query.page); // 현재 페이지 번호
        var perpagenum = parseInt(req.query.perpagenum); // 화면에 출력될 페이지수
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                conn.query('select count(*) as totalCount from supplier',function(err, rows){
                    
                    var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                    conn.query('select * from supplier where supplier_no > 0 limit ?,?',[context.startpage,perpagenum],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('supplier',{rows: rows ,context: context});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    });
                });
            });
            
        }
    });
    
    router.route('/fodupdate').post(function(req,res){
       console.log('fodupdate 패스 요청됨');
        
        var body = req.body;
        var priceInt = Number(req.body.price);
        var invenInt = Number(req.body.inven);
        var delcountInt = Number(req.body.delcount);
    
        var page = req.body.page;
        var perpagenum = req.body.perpagenum;
        
        if(!req.user){
            console.log('사용자 인증 안된 상태임');
            res.redirect('/');
        } else {
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
                
                var from = "food";
                var exec = conn.query('update ?? set food_name=?, food_supplier=?, food_origin=?, food_price=?, food_inven=?, food_delcount=?, food_deldate=?, food_distrdate=? where food_no=?',[from, body.name, body.supp, body.origin, priceInt, invenInt,delcountInt, body.deldate, body.distrdate, body.no],function(err, rows){
                conn.release();
                if(err){
                    console.log('데이터 변경 실패' + err);
                } else {
                    res.redirect('food?page='+page+"&perpagenum="+perpagenum);
                }
            });
            });
        }
    });
    
    router.route('/fodedit').get(function(req,res){
        console.log('fodedit 패스 요청됨');
        
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        console.log(page + ","+perpagenum);
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.');
                }
               
                var exec = conn.query('select food_no,food_name,food_supplier,food_origin,food_price,food_inven,food_delcount, date_format(food_deldate,"%Y-%m-%d") as food_deldate, date_format(food_distrdate,"%Y-%m-%d") as food_distrdate, date_format(food_update,"%Y-%m-%d") as food_update from food where food_no=?',id,function(err,rows){
    
                    conn.release();
                    if(rows.length > 0){
                        res.render('fodedit',{rows: rows[0], context: context});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
                
            });
        }
    });
    
    router.route('/foddel').get(function(req,res){
        console.log('foddel 패스 요청됨');
        
        
        var id = req.query.id;
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        if(!req.user){
            console.log('사용자 인증 안된상태');
            res.redirect('/');
        } else {
            
            pool.getConnection(function(err,conn){
               if(err){
                   if(conn){
                       conn.release();
                   }
                console.log('에러가 발생하였습니다.');
               } 
                var exec = conn.query('delete from food where food_no=?',id,function(err,rows){
                    conn.release();
                    if(err){
                        console.log('데이터 못찾음'); 
                    } else {
                        res.redirect('/food?page='+page+"&perpagenum="+perpagenum);
                    }
                    
                });
                
            });
        }
    });
    
    
    router.route('/foodadd').post(function(req,res){
        console.log('/foodadd 패스 요청됨');
        
        var name = req.body.name || req.query.name;
        var supp = req.body.supp || req.query.supp;
        var origin = req.body.origin || req.query.origin;
        var price = Number(req.body.price || req.query.price);
        var inven = Number(req.body.inven || req.query.inven);
        var delcount = Number(req.body.delcount || req.query.delcount);
        var deldate = req.body.deldate || req.query.deldate;
        var distrdate = req.body.distrdate || req.query.distrdate;
        
        var page = req.body.page || req.query.page;
        var perpagenum = req.body.perpagenum || req.query.perpagenum;
        
        console.log(name + ',' + supp + ',' + origin + ',' + price + "," + inven + "," + delcount + "," + deldate + "," + distrdate);
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                var data = {food_no:10,food_name:name,food_supplier:supp,food_origin:origin,food_price:price,food_inven:inven,food_delcount:delcount,food_deldate:deldate,food_distrdate:distrdate,food_update:null};
                var exec = conn.query('insert into food set ?',data,function(err,rows){
                    conn.release();
                     
                    if(err){
                        console.log('데이터 저장실패');
                    } else {
                        res.redirect('food?page='+page+"&perpagenum="+perpagenum);
                    }
                   
                });
            });   
        }
    });
    
    
    router.route('/foodadd').get(function(req,res){
        console.log('foodadd 패스 요청됨');
        
        
        var page = req.query.page;
        var perpagenum = req.query.perpagenum;
        
        var context = {
            page : page,
            perPage : perpagenum
        }
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                var exec = conn.query('select * from supplier',function(err,rows){
                    conn.release();
                    
                    if(rows.length > 0){
                        res.render('foodadd',{rows: rows,context:context});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
            });
            
        }
    });
    
    router.route('/food').get(function(req,res){
        console.log('food 패스 요청됨');
    
        var page = parseInt(req.query.page); // 현재 페이지 번호
        var perpagenum = parseInt(req.query.perpagenum); // 화면에 출력될 페이지수
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
            console.log('사용자 인증된 상태임.');
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                conn.query('select count(*) as totalCount from food',function(err, rows){
                    
                    var context = paging.add(page,perpagenum,rows[0].totalCount);
                    
                    conn.query('select food_no,food_name,food_supplier,food_origin,food_price,food_inven,food_delcount, date_format(food_deldate,"%Y-%m-%d") as food_deldate, date_format(food_distrdate,"%Y-%m-%d") as food_distrdate, date_format(food_update,"%Y-%m-%d") as food_update from food where food_no > 0 limit ?,?',[context.startpage,perpagenum],function(err,rows){
                    conn.release();
                    if(!err){
                        res.render('food',{rows: rows, context: context});    
                    } else {
                        console.log('데이터 못찾음');
                    }
                    });
                });
            });
            
        }
        
    });
    //회원정보수정 화면
    router.route('/edit').post(function(req,res){
        console.log('edit 패스 요청됨'); 
        
        
        var body = req.body;
        pool.getConnection(function(err,conn){
            if(err){
                if(conn){
                    conn.release();
                }
                
            console.log('에러가 발생하였습니다.' + err);
            }
            
            var from = "관리자";
            var exec = conn.query('update ?? set 아이디=?, 이름=?, 전화번호=?, 직책=? where 아이디=?',[from, body.id,body.name, body.phone, body.depart, body.id],function(err, rows){
                conn.release();
                if(err){
                    console.log('데이터 삽입 실패' + err);
                } else {
                    res.redirect('/profile');
                }
            });
        });
    });
    
    
    
    //회원정보  불러오기
    router.route('/profile').get(function(req,res){
        console.log('profile 패스 요청됨.');
        
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.redirect('/');
        } else {
        
        pool.getConnection(function(err,conn){
           if(err){
               if(conn){
                   conn.release();
               }
            console.log('에러가 발생하였습니다.' + err);
           } 
            
            var id = req.user[0].아이디;
            var exec = conn.query("select * from 관리자 where 아이디 = ?", id, function(err, rows){
                conn.release();
                console.log('실행 대상 SQL' + exec.sql);
                if(rows.length > 0){
                    res.render('profile',{root: rows[0]});    
                } else {
                    console.log('일치하는 사용자를 찾지 못함');
                }
                
            });
            
            conn.on('error', function(err) {      
                console.log('데이터베이스 연결 시 에러 발생함.');
                console.dir(err);
            });
        });
        }
    });
    
    // 홈 화면
    router.route('/').get(function(req, res) {
        console.log('/ 패스 요청됨.');

        console.log('req.user의 정보');
        console.dir(req.user);

        // 인증 안된 경우
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            res.render('index.ejs', {login_success:false});
        } else {
            console.log('사용자 인증된 상태임.');
            res.render('index.ejs', {login_success:true});
        }
    });
    
    // 로그인 화면
    router.route('/login').get(function(req, res) {
        console.log('/login 패스 요청됨.');
        
        if(!req.user){
            res.render('login.ejs', {login_success:false, message: req.flash('loginMessage')});
        } else {
            res.render('login.ejs', {login_success:true, message: req.flash('loginMessage')});
        }
        
    });
	 
    // 회원가입 화면
    router.route('/signup').get(function(req, res) {
        console.log('/signup 패스 요청됨.');
        res.render('signup.ejs', {message: req.flash('signupMessage')});
    });
	 
    // 메인 화면
    router.route('/main').get(function(req, res) {
        console.log('/main 패스 요청됨.');

        // 인증된 경우, req.user 객체에 사용자 정보 있으며, 인증안된 경우 req.user는 false값임
        console.log('req.user 객체의 값');
        console.dir(req.user);

        // 인증 안된 경우
        if (!req.user) {
            console.log('사용자 인증 안된 상태임.');
            
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                var exec = conn.query('select * from 잔반 where 잔반일자=curdate();select * from 공지사항 order by 작성일자 desc limit 0,3',function(err,rows){
                    conn.release();
                    
                    if(rows.length > 0){
                        res.render('main.ejs', {rows: rows[0], rows2:rows[1], login_success:false});
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
            });
            
            
        } else if(req.user) {
            console.log('사용자 인증된 상태임.');
            console.dir(req.user);
            
            
            pool.getConnection(function(err,conn){
                if(err){
                    if(conn){
                        conn.release();
                    }
                console.log('에러가 발생하였습니다.' + err);
                }
                
                var exec = conn.query('select * from 잔반 where 잔반일자=curdate();select * from 공지사항 order by 작성일자 desc limit 0,3',function(err,rows){
                    conn.release();
                    if(rows.length > 0){
                        
                        if (Array.isArray(req.user)) {
                                res.render('main.ejs', {rows: rows[0],rows2:rows[1], user: req.user[0], login_success:true});
                        } else {
                                res.render('main.ejs', {user: req.user});
                        }
                    } else {
                        console.log('데이터 못찾음');
                    }
                    
                });
            });
        }
    });
	
    // 로그아웃
    router.route('/logout').get(function(req, res) {
        console.log('/logout 패스 요청됨.');
        req.logout();
        res.redirect('main');
    });

    // 로그인 passport 인증
    router.route('/login').post(passport.authenticate('local-login', {
        successRedirect : '/main', 
        failureRedirect : '/login', 
        failureFlash : true 
    }));

    // 회원가입 passport 인증
    router.route('/signup').post(passport.authenticate('local-signup', {
        successRedirect : '/main', 
        failureRedirect : '/signup', 
        failureFlash : true 
    }));
};