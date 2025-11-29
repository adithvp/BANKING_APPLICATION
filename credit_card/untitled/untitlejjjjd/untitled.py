from flask import Flask,render_template,request,redirect,session
from DBConnection import Db

app = Flask(__name__)
app.sceret_key="abc"


@app.route('/',methods=['get','post'])
def login():
    if request.method=="POST":
        us=request.form['textfield']
        pwd=request.form['textfield2']
        db=Db()
        qry=db.selectOne("select * from login where user_name='"+us+"' and password='"+pwd+"'")
        if qry is not None:
            if qry['user_type']=='admin':
                session['lg']="lin"
                return redirect('/adminhome')
            elif qry['user_type']=='branch':
                session['lid']=qry['login_id']
                session['lg']="lin"

                return redirect('/brachhome')

            else:
                return '''<script>alert("INVALID USER");window.location="/"</script>'''

        else:
            return '''<script>alert("INVALID USER");window.location="/"</script>'''
    else:
      return render_template("login.html")



@app.route('/adminhome')
def adminhome():
    return render_template("admin/adminhome.html")



@app.route('/ Atm_approve_reject')
def Atm_approve_reject():
    db=Db()
    return render_template("admin/Atm approve&reject.html")

@app.route('/Branchadd',methods=['get','post'])
def Branchadd():
    if session['lg']=="lin":
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
    else:
        return redirect('/')
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
        return '<script>alert("REPLY SENDED SUCCESSFULLY");window.location="/viewcomplaint"</script>'
    else:
        return render_template("admin/sendreplay.html")


@app.route('/logout')
def logout():
    session.clear()
    session['lg']=""
    return redirect("/")

################################################customer##########################

@app.route('/vieprofile')
def vieprofile():
    return render_template("branch/View profile.html")

@app.route('/addcustomer')
def addcustomer():
    return render_template("branch/add customer.html")


if __name__ == '__main__':
    app.run()
