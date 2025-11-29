import tkinter
from tkinter import *
import tkinter as tk
from tkinter import messagebox
from tkinter.ttk import Combobox
from PIL import ImageTk
from PIL import Image
# from serial import time



import  MySQLdb
i=0
con=MySQLdb.Connect(host='localhost',port=3306,user='root',passwd='',db='credit_card')
cmd=con.cursor()
def otppage1(result,oid,lid):
    root = Tk()
    root.geometry('780x550+20+0')
    root.title("Aspire BANK")

    canvas = Canvas(width=200, height=200)
    canvas.pack(expand=YES, fill=BOTH)

    image = ImageTk.PhotoImage(file=r"static/tkimgs/fp.jpg")
    canvas.create_image(0, 0, image=image, anchor=NW)

    canvas = Canvas(root, width=100, height=150)
    canvas.place(relx=0.1, rely=0.5)
    ######################################
    ######################################
    cmd.execute("select photo from customer where c_id="+str(lid))
    ss=cmd.fetchone()

    ######################################
    ######################################
    print(ss[0])
    img = Image.open("D:/creditcard/untitled/"+ss[0])
    # img = img.zoom(25)  # with 250, I ended up running out of memory
    # img = img.subsample(32)  # mechanically, here it is adjusted to 32 instead of 320


    img = img.resize((100, 150), Image.ANTIALIAS)
    img=ImageTk.PhotoImage(img)
    canvas.create_image(0, 0, anchor=NW, image=img)

    l2 = Label(root, text="ATM", font="Helvetica 25 bold")
    l2.place(relx=0.5, rely=0.05)

    l3 = Label(root, text="Aspire Bank", font="Helvetica 45 bold")
    l3.place(relx=0.3, rely=0.25)


    def btnclick():
        amt=e1.get()
        cmd.execute("select balance from account where c_id=" + str(lid))
        ss = cmd.fetchone()
        if float(ss[0])>float(amt):
            cmd.execute("update account set balance=balance-"+str(amt)+" where account_id="+str(lid))
            cmd.execute("update otp set status='finished' where o_id='"+str(oid)+"'")
            cmd.execute("insert into transaction values('',curtime(),curdate(),'"+amt+"','"+lid+"','debit','')")
            con.commit()
            messagebox.showinfo("Authentication", "Successfull")
            root.destroy()

        else:
            messagebox.showinfo("Authentication", "Insufficient Balance")
            root.destroy()


    l2 = Label(root, text="Please enter your Amount",font="Helvetica 15 bold")
    l2.place(relx=0.25, rely=0.55)

    e1=Entry(root, justify = CENTER,
                                     font = ('courier', 15, 'bold'))
    e1.place(relx=0.6,rely=0.55)

    b1 =Button(root, text="Withdraw", command=btnclick,font =('Helvetica', 10, 'bold', 'underline'), foreground = 'black',borderwidth = '4')
    b1.place(relx=0.475, rely=0.7 )

    root.mainloop()
# otppage1((8,'naveen',100.0),13)