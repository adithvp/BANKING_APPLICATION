from flask import Flask,render_template,request,redirect,session,jsonify
from DBConnection import Db
import datetime
import random

app = Flask(__name__)
app.secret_key="abcssasdsd"


@app.route('/',methods=['get','post'])
def login():
    if request.method=="POST":
        us=request.form['textfield']
        pwd=request.form['textfield2']
        db=Db()
        qry=db.selectOne("select * from login where user_name='"+us+"' and password='"+pwd+"'")
        if qry is not None:
            session['lid'] = qry['login_id']
            if qry['user_type']=='admin':
                # session['lg']="log"
                return redirect('/adminhome')
            elif qry['user_type']=='branch':

                # session['lg']="log"
                return redirect('/branchhome')
            elif qry['user_type']=='atm':

                # session['lg']="log"
                return redirect('/atmhome')

            else:
                return '''<script>alert("INVALID USER");window.location="/"</script>'''

        else:
            return '''<script>alert("INVALID USER");window.location="/"</script>'''
    else:
      return render_template("index.html")



@app.route('/adminhome')
def adminhome():
    return render_template("adminindex.html")



@app.route('/ Atm_approve_reject')
def Atm_approve_reject():
    db=Db()
    return render_template("admin/Atm approve&reject.html")

@app.route('/Branchadd',methods=['get','post'])
def Branchadd():
    # if session['lg']=="lin":
         if request.method=="POST":
             branch_name=request.form['textfield']
             branch_code = request.form['textfield7']
             place=request.form['textfield2']
             district=request.form['textfield3']
             ifsc_code=request.form['textfield4']
             email=request.form['textfield5']
             phone=request.form['textfield6']
             db = Db()
             db.insert("insert into branch VALUES('','"+branch_name+"','"+branch_code+"' ,'"+place+"','"+ district+"','"+ifsc_code+"','"+email+"','"+phone+"')")
             return '''<script>alert("ADD SUCCESSFULLY");window.location="/adminhome"</script>'''
         else:
             return render_template("admin/Branch add.html")
    # else:
    #     return redirect('/')
@app.route('/Branchedit/<did>',methods=['get','post'])
def Branchedit(did):
    if request.method == "POST":
        branch_name = request.form['textfield']

        place = request.form['textfield2']
        district = request.form['textfield3']
        ifsc_code = request.form['textfield4']
        email = request.form['textfield5']
        phone = request.form['textfield6']
        branch_code = request.form['textfield7']
        db = Db()
        db.update("update branch set Branch_name='"+branch_name+"',Place='"+place+"',District='"+district+"',IFSC_code='"+ifsc_code+"',Email='"+email+"',Phone='"+phone+"' ,branch_code='"+branch_code+"' where Branch_id='"+did+"'")
        return '''<script>alert("UPDATE SUCCESSFULLY");window.location="/Branchview"</script>'''
    else:
        db=Db()
        qry=db.selectOne("select * from branch where Branch_id='"+did+"' ")
        return render_template("admin/Branch edit.html",data=qry)


@app.route('/Branchdelete/<did>')
def Branchdelete(did):
    db = Db()
    db.delete("delete from branch where Branch_id='"+did+"'")
    return '''<script>alert("DELETED SUCCESSFULLY");window.location="/Branchview"</script>'''


@app.route('/Branchview')
def Branchview():
    db = Db()
    qry=db.select("select * from branch")
    return render_template("admin/Branch view.html",data=qry)


@app.route('/viewatmrequest')
def viewatmrequest():
    db = Db()
    atm=db.select("select * from atm ,customer where atm.c_id=customer.c_id and atm.status='pending'")
    return render_template("admin/Atm approve&reject.html",data=atm)

@app.route('/approve/<cid>')
def approve(cid):
    db = Db()
    db.update("update atm set status='approved'where card_id='"+cid+"'")
    return '<script> alert("APPROVED SUCCESSFULLY") window.location="/viewatmrequest"</script>'


@app.route('/reject/<cid>')
def reject(cid):
    db = Db()
    db.update("update atm set status='rejected'where card_id='"+cid+"'")
    return '<script> alert("REJECTED!!") window.location="/viewatmrequest"</script>'


@app.route('/customerview')
def customerview():
    db = Db()
    qry=db.select("select * from branch,customer where customer.branch_id=branch.Branch_id")
    return render_template("admin/Customer view.html",data=qry)

@app.route('/viewcomplaint')
def viewcomplaint():
    db = Db()
    res=db.select("select * from complaint , customer where complaint.c_id=customer.c_id")

    return render_template("admin/View Complaint.html",data=res)


@app.route('/sendreply/<cid>',methods=['get','post'])
def sendreply(cid):
    if request.method=="POST":
        reply=request.form['textarea']
        db = Db()
        db.update("update complaint set replay='"+reply+"',replay_date=curdate() where complaint_id='"+cid+"'")
        return '<script>alert(" ADDED SUCCESSFULLY");window.location="/viewcomplaint"</script>'
    else:
        return render_template("admin/sendreplay.html")


# @app.route('/logout')
# def logout():
#     session.clear()
#     session['lg']=""
#     return redirect("/")

################################################       BRANCH          ###################################################################
@app.route('/branchhome')
def branchhome():
    return render_template("branchindex.html")

@app.route('/viewprofile')
def vieprofile():
    db=Db()
    qry=db.selectOne("select * from branch where branch_id='"+str(session['lid'])+"'")
    return render_template("branch/View profile.html",data=qry)


@app.route('/addatm',methods=['get','post'])
def addatm():
    if request.method == "POST":
        c_id=request.form['select']
        card_no=request.form['textfield']
        issue_date=request.form['textfield2']
        expiry_date=request.form['textfield3']
        pin=request.form['textfield4']
        db = Db()
        db.insert("insert into atm VALUES('','"+c_id+"','"+card_no+"','"+issue_date+"','"+expiry_date+"','"+pin+"' ,'pending')")
        return '<script>alert(" ADDED SUCCESSFULLY");window.location="/atmview"</script>'
    else:
        db=Db()
        qry=db.select("select * from customer where branch_id='"+str(session['lid'])+"'")
        return render_template("branch/atmcounter add.html",data=qry)

@app.route('/atmview')
def atmview():
    db = Db()
    qry = db.select("select atm.pin as atmpin,atm.*,customer.* from atm,customer where atm.c_id=customer.c_id and customer.branch_id='"+str(session['lid'])+"'")
    return render_template("branch/atmcounter view.html", data=qry)



@app.route('/updateatm/<did>',methods=['get','post'])
def updateatm(did):
    if request.method == "POST":
        c_id=request.form['select']
        card_no=request.form['textfield']
        issue_date=request.form['textfield2']
        expiry_date=request.form['textfield3']
        pin=request.form['textfield4']
        db = Db()
        db.update("update atm set c_id='"+c_id +"',card_no='"+card_no +"',issue_date='"+issue_date +"',expiry_date='"+expiry_date +"',pin='"+pin +"'where card_id='"+did+"'")
        return '<script>alert(" UPDATED SUCCESSFULLY");window.location="/atmview"</script>'
    else:
        db=Db()
        res=db.select("select * from customer  where branch_id='"+str(session['lid'])+"'")
        qry=db.selectOne("select * from atm,customer where atm.c_id=customer.c_id and atm.card_id='"+did+"'")
        return render_template("branch/atmcounter edit.html",data=res,data1=qry)


@app.route('/atmdelete/<did>')
def atmdelete(did):
    db = Db()
    db.delete("delete from atm where card_id='" + did + "'")
    return '''<script>alert("DELETED SUCCESSFULLY");window.location="/atmview"</script>'''


@app.route('/addcustomer',methods=['get','post'])
def addcustomer():
    if request.method == "POST":
        c_name = request.form['textfield']
        house_name = request.form['textfield20']
        place = request.form['textfield21']
        post=request.form['textfield2']
        district=request.form['textfield3']
        pin=request.form['textfield4']
        email=request.form['textfield6']
        phone=request.form['textfield7']
        photo=request.files['fileField']
        date=datetime.datetime.now().strftime("%y%m%d-%H%M%S")
        photo.save(r"D:\creditcard\untitled\static\pic\\"+date+'.jpg')
        res="/static/pic/"+date+'.jpg'
        password=random.randint(0000,9999)
        db = Db()
        ss=db.insert("insert into login values ('','"+email+"','"+str(password)+"','customer')")
        db.insert("insert into customer VALUES ('"+str(ss)+"','"+c_name+"','"+place+"' ,'"+phone+"','"+ email+"','"+house_name+"','"+post+"','"+pin+"','"+str(session['lid'])+"','"+str(res)+"','"+district+"')")
        return '<script>alert(" ADDED SUCCESSFULLY");window.location="/viewcustomer"</script>'
    else:
        return render_template("branch/add customer.html")


@app.route('/updatecustomer/<cid>',methods=['get','post'])
def updatecustomer(cid):
    if request.method == "POST":
        c_name = request.form['textfield']
        house_name = request.form['textfield20']
        place = request.form['textfield21']
        post = request.form['textfield2']
        district = request.form['textfield3']
        pin = request.form['textfield4']
        email = request.form['textfield6']
        phone = request.form['textfield7']
        photo = request.files['fileField']
        date = datetime.datetime.now().strftime("%y%m%d-%H%M%S")
        photo.save(r"D:\creditcard\untitled\static\pic\\" + date + '.jpg')
        res = "/static/pic/" + date + '.jpg'
        if request.files!="":
            if photo.filename!="":
                db = Db()
                db.update("update customer set c_name='" + c_name + "',place='"+place+"',house_name='" +house_name+ "',post='" + post + "',district='" + district + "',pin='" + pin + "',email='" + email + "',phone='" + phone + "',photo='" + str(res) + "' where c_id='"+cid+"'")
                return '<script>alert(" ADDED SUCCESSFULLY");window.location="/viewcustomer"</script>'
            else:
                db = Db()
                db.update("update customer set c_name='" + c_name + "',place='" + place + "',house_name='" + house_name + "',post='" + post + "',district='" + district + "',pin='" + pin + "',email='" + email + "',phone='" + phone + "'  where c_id='"+cid+"'")
                return '<script>alert(" ADDED SUCCESSFULLY");window.location="/viewcustomer"</script>'
        else:
            db = Db()
            db.update("update customer set c_name='" + c_name + "',place='" + place + "',house_name='" + house_name + "',post='" + post + "',district='" + district + "',pin='" + pin + "',email='" + email + "',phone='" + phone + "' where c_id='"+cid+"'")
            return '<script>alert(" ADDED SUCCESSFULLY");window.location="/viewcustomer"</script>'
    else:
        db=Db()
        ss=db.selectOne("select * from customer  where c_id='"+cid+"'")
        return render_template("branch/customer update.html",data=ss)




@app.route('/viewcustomer')
def viewcustomer():
    db = Db()
    qry=db.select("select * from customer  where branch_id='"+str(session['lid'])+"'")
    return render_template("branch/view customer.html",data=qry)

@app.route('/customerdelete/<did>')
def customerdelete(did):
    db = Db()
    db.delete("delete from customer where c_id='"+did+"'")
    db.delete("delete from login where login_id='"+did+"'")
    return '''<script>alert("DELETED SUCCESSFULLY");window.location="/viewcustomer"</script>'''

@app.route('/atmreq')
def atmreq():
    db = Db()
    qry=db.select("select * from atm,customer where atm.c_id=customer.c_id and customer.branch_id='"+str(session['lid'])+"'")
    return render_template("branch/atm req.html",data=qry)

@app.route('/addaccount/<did>',methods=['get','post'])
def addaccount(did):
    if request.method=="POST":
        accountno=request.form['textfield']
        ifsccode=request.form['textfield2']
        balance=request.form['textfield3']
        db=Db()
        # db.update("update account set account_no='"+accountno+"',IFSC_code='"+ifsccode+"',balance='"+balance+"' where c_id='"+did+"'")
        db.insert("insert into account VALUES ('','"+did+"','"+ifsccode+"','"+accountno+"','"+balance+"')")
        return '''<script>alert("ACCOUNT ADDED SUCCESSFULLY");window.location="/viewcustomer"</script>'''
    else:
        return render_template("branch/addaccount.html")


@app.route('/forward/<did>')
def forward(did):
    db = Db()
    db.update("update atm set status='forwarded' where card_id='"+did+"'")
    return '''<script>alert("FORWARDED SUCCESSFULLY");window.location="/atmreq"</script>'''



@app.route('/blockunblock')
def blockunblock():
    db = Db()
    qry=db.select("select * from atm,customer where atm.c_id=customer.c_id and customer.branch_id='"+str(session['lid'])+"' and atm.status!='pending' and atm.status!='rejected' and atm.status!='forwarded'")
    return render_template("branch/block&unblock.html",data=qry)



@app.route('/block/<did>')
def block(did):
    db = Db()
    db.update("update atm set status='blocked' where card_id='" + did + "'")
    return '''<script>alert("BLOCKED ");window.location="/blockunblock"</script>'''



@app.route('/unblock/<did>')
def unblock(did):
    db = Db()
    db.update("update atm set status='approved' where card_id='" + did + "'")
    return '''<script>alert("UNBLOCKED ");window.location="/blockunblock"</script>'''





@app.route('/transaction')
def transaction():
    db = Db()
    qry=db.select("select * from transaction,customer where transaction.customer_id=customer.c_id and  customer.branch_id='"+str(session['lid'])+"'")
    return render_template("branch/View transaction.html",data=qry)




################################################       customer          ###################################################################

###########################ANDROID############################


@app.route('/andlogin',methods=['post'])
def andlogin():
    db = Db()
    username=request.form['name']
    password=request.form['password']
    res=db.selectOne("select * from login where user_name='"+username+"' AND password='"+password+"'")
    return jsonify(status="OK",lid=res['login_id'],type=res['user_type'])



@app.route('/andprofile',methods=['post'])
def andprofile():
    db = Db()
    login=request.form['lid']
    res=db.selectOne("select * from customer,branch where customer.branch_id=branch.Branch_id and customer.c_id='"+login+"' ")
    return jsonify(status="OK",data=res)



@app.route('/andviewaccount',methods=['post'])
def andviewaccount():
    db = Db()
    login=request.form['lid']
    res=db.select("select * from account,customer where account.c_id=customer.c_id AND customer.c_id='"+login+"'")
    return jsonify(status="OK",data=res)




@app.route('/andtransaction',methods=['post'])
def andtransaction():
    login=request.form['lid']
    db = Db()
    res=db.select("select * from transaction,customer where transaction.customer_id=customer.c_id and transaction.customer_id='"+login+"'")
    return jsonify(status="OK",data=res)


@app.route('/andsendcom',methods=['post'])
def andsendcom():

    login=request.form['lid']
    complaint=request.form['complaint']
    db = Db()
    res=db.insert("insert into complaint VALUES ('','"+login+"','"+complaint+"',curdate(),'pending','pending')")
    return jsonify(status="OK",data=res)


@app.route('/andviewrep',methods=['post'])
def andviewrep():
    db = Db()
    login=request.form['lid']
    res=db.select("select * from complaint,customer where complaint.c_id=customer.c_id and complaint.c_id='"+login+"'")
    return jsonify(status="OK",data=res)



@app.route('/andhistory',methods=['post'])
def andhistory():
    lid=request.form['lid']
    db = Db()
    res=db.select("select * from blockhistory,atm,counter where blockhistory.atm_id=atm.card_id  and blockhistory.counter_id=counter.counter_id and atm.c_id='"+lid+"'")
    # if len(res)>0:
    #     return jsonify(status="OK")
    # else:
    print(res)
    return jsonify(status="ok",data=res)


@app.route('/andviewatm',methods=['post'])
def andviewatm():
    db = Db()
    login=request.form['lid']
    res=db.select("select * from atm,customer where atm.c_id=customer.c_id and atm.c_id='"+login+"' ")
    return jsonify(status="OK",data=res)

@app.route('/and_sendrequest',methods=['post'])
def and_sendrequest():
    uid=request.form['id']
    db=Db()
    res=db.selectOne("select * from atm where atm.c_id='"+uid+"' ")
    if res is not None:
        return jsonify(status="a")
    else:
        db=Db()
        db.insert("insert into atm values ('','"+uid+"','pending','pending','pending','pending','pending')")
        return jsonify(status="ok")

######################################################      ATM           #################################################################################

@app.route('/atmhome')
def atmhome():
    return render_template("atm/atmhome.html")


@app.route('/readdetails',methods=['get','post'])
def readdetails():
    db = Db()
    res=db.selectOne("select * from atm,customer where atm.c_id=customer.c_id and atm.card_id='"+str(session['lid'])+"'")
    return render_template("atm/read details.html",data=res)











##################################################################################################################################################

if __name__ == '__main__':
    app.run(host="0.0.0.0")
