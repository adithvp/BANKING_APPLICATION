import tkinter
from tkinter import *
import tkinter as tk
from tkinter import messagebox
from tkinter.ttk import Combobox
# from serial import time
import time
from PIL import ImageTk

# from bank.newpae import homepage

import  MySQLdb
i=0
con=MySQLdb.Connect(host='localhost',port=3306,user='root',passwd='',db='credit_card')
cmd=con.cursor()
# def otppage(result,otp,oid):
# def otppage(oid,pwd):
def otppage(pwd,qry,lid):
    root = Tk()
    root.geometry('780x550+20+0')
    # root.wm_iconbitmap(r'static\sync.ico')
    root.title("Aspire Bank")

    canvas = Canvas(width=200, height=200)
    canvas.pack(expand=YES, fill=BOTH)

    image = ImageTk.PhotoImage(file=r"static/tkimgs/fp.jpg",height="800")
    canvas.create_image(0, 0, image=image, anchor=NW)

    def Recive():
        global i
        time.sleep(1)
        i=i+1
        print(i)

        # con = MySQLdb.connect(host='localhost', port=3306, user='root', passwd='', db='credit_card')
        # cmd = con.cursor()
        # cmd.execute("SELECT * FROM otp WHERE  `status`='pending' and c_id='"+lid+"'")
        # s=cmd.fetchone()
        # if s is not None:
        #     messagebox.showinfo("Authentication", "Success")
        #     root.destroy()
        #     from final import otppage1
        #     # otppage1(oid)
        #     otppage1(pwd,qry,lid)

        if i==100:
            cmd.execute("update otp set status='timeout' and c_id='"+lid+"'")
            # cmd.execute("update otp set status='timeout' where o_id="+str(oid))
            con.commit()
            messagebox.showinfo("Atuthentication", "Timeout")
            root.destroy()
            # from untitled.home import homefn


        root.after(1, Recive)

    def btnclick():
        cotp=e1.get()
        if cotp != '':
            if pwd==cotp:
                con = MySQLdb.connect(host='localhost', port=3306, user='root', passwd='', db='credit_card')
                cmd = con.cursor()
                cmd.execute("SELECT * FROM otp WHERE  `status`='pending' and c_id='"+lid+"' ")
                s=cmd.fetchone()
                if s is not None:
                    messagebox.showinfo("Authentication", "Success")
                    root.destroy()
                    from final import otppage1
                    # otppage1(oid)
                    otppage1(pwd,qry,lid)
            else:
                messagebox.showinfo("Authentication", "Failed")
        else:
            messagebox.showinfo("Authentication", "Failed")

    l2 = Label(root, text="ATM", font="Helvetica 25 bold")
    l2.place(relx=0.5, rely=0.05)

    l3 = Label(root, text="Aspire Bank", font="Helvetica 45 bold")
    l3.place(relx=0.3, rely=0.25)

    # l2 = Label(root, text="Hai "+result[1]+" Please Check your application",font="Helvetica 20 bold")
    # l2.place(relx=0.15, rely=0.45)

    e1=Entry(root)
    e1.place(relx=0.6,rely=0.05)

    b1 =Button(root, text="Next", command=btnclick)
    b1.place(relx=0.475, rely=0.8)
    root.after(1, Recive)
    root.mainloop()
