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
def otppage():
    root = Tk()
    root.geometry('1000x1000+20+0')
    # root.wm_iconbitmap(r'static\sync.ico')
    root.title("Aspire Bank")

    canvas = Canvas(width=700, height=600)
    canvas.pack(expand=YES, fill=BOTH)

    image = ImageTk.PhotoImage(file=r"static/tkimgs/atm.jpg")


    canvas.create_image(50, 10, image=image, anchor=NW)


    def btnclick():
        cotp=e1.get()
        if cotp == '':
            import pyttsx3
            # initialize Text-to-speech engine
            engine = pyttsx3.init()
            # convert this text to speech
            text = "Please enter card details"
            engine.say(text)
            # play the speech
            engine.runAndWait()
        else:
            cmd.execute("select c_id from atm where card_no=" + str(cotp))
            ss = cmd.fetchone()
            print(ss)
            if ss is not None:

                messagebox.showinfo("Authentication", "Success!!!")
                root.destroy()
                from camera import abc
                obj=abc()
                obj.check_face(ss[0])

            else:
                import pyttsx3
                # initialize Text-to-speech engine
                engine = pyttsx3.init()
                # convert this text to speech
                text = "Invalid card details"
                engine.say(text)
                # play the speech
                engine.runAndWait()

    l2 = Label(root, text="CARD NUMBER", font="Helvetica 25 bold")
    l2.place(relx=0.4, rely=0.65)
    l3 = Label(root, text="Aspire Bank", font="Helvetica 45 bold")
    l3.place(relx=0.4, rely=0.3)
    # l2 = Label(root, text="Hai "+result[1]+" Please Check your application",font="Helvetica 20 bold")
    # l2.place(relx=0.15, rely=0.45)
    e1=Entry(root)
    e1.place(relx=0.45,rely=0.75)
    b1 =Button(root, text="Next", command=btnclick)
    b1.place(relx=0.475, rely=0.8)
    root.mainloop()
otppage()