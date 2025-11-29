import random
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import face_recognition
from imutils.video import VideoStream
import numpy as np
import argparse
import imutils
import time
import cv2
import datetime

from otp import otppage

d=datetime.datetime.now().strftime("%Y%m%d-%H%M%S")

img_counter = 0
path=r"D:\creditcard\untitled\static\\"
    # r"D:\Project\amsteck\e_voting\static\\"
imgpath=r"D:\creditcard\untitled\static\pic\\"
# path=r"G:\2021-2022\smartlabpattuvam\untitled\static\\"

class abc:
    # loop over the frames from the video stream

    def check_face(self, lid):
        print("[INFO] starting video stream...")
        vs = VideoStream(src=0).start()
        time.sleep(2.0)
        while True:
            # grab the frame from the threaded video stream and resize it
            # to have a maximum width of 400 pixels
            frame = vs.read()
            frame = imutils.resize(frame,width=400)
            imgname = path+"h3.jpg".format(img_counter)
            cv2.imwrite(imgname, frame)


            cv2.imshow("Frame", frame)
            # key = cv2.waitKey(1) & 0xFF

            # if the `q` key was pressed, break from the loop
            # if key == ord("q"):
            #     break
            break

        cv2.destroyAllWindows()
        vs.stop()

        print("hiii ", lid)
        lid=str(lid)
        from PIL import Image
        from DBConnection import Db
        qry = "select * from customer where c_id='"+lid+"'"
        # qry = "select * from criminal"
        db = Db()
        res = db.selectOne(qry)
        print(res)
        known_faces = []
        userids = []
        person_name = []
        identified = []
        if res is not None:
            # for result in res:
                result=res
                picc = result["photo"]
                pname = picc.split("/")
                img = imgpath + pname[len(pname) - 1]
                print(img)
                b_img = face_recognition.load_image_file(img)
                b_imgs = face_recognition.face_encodings(b_img)[0]
                known_faces.append(b_imgs)
                userids.append(result["c_id"])
                person_name.append(result["c_name"])
                print(str(len(known_faces)) + "done")

                print("hloo")
                # unknown_image = face_recognition.load_image_file(staticpath + "a_270.jpg")
                unknown_image = face_recognition.load_image_file(path + "h3.jpg")
                unkonownpersons = face_recognition.face_encodings(unknown_image)
                print(len(unkonownpersons), "llllllllllllllllllllllll")
                if len(unkonownpersons) > 0:

                    for i in range(0, len(unkonownpersons)):
                        h = unkonownpersons[i]


                        red = face_recognition.compare_faces(known_faces, h, tolerance=0.45)  # true,false,false,false]
                        print(red)
                        for i in range(0, len(red)):
                            if red[i] == True:
                                identified.append(userids[i])
                    print(identified,"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk")
                    l=identified
                    print("LL", l)
                    if len(l) > 0:
                        db = Db()
                        pswd = random.randint(0000, 9999)
                        res = db.selectOne("select * from login where login_id='" + lid + "'")
                        if res is not None:
                            email=res['user_name']
                            qry1=db.selectOne("select * from otp where c_id='"+lid+"'")
                            if qry1 is not None:
                                q=db.update("update otp set otp='"+str(pswd)  +"',status='pending' where c_id='"+lid+"' ")
                                # oid = q['o_id']
                                pwd = str(pswd)
                                import smtplib
                                print("eeeeeeeeeeeeeeeeeeeee", email)

                                s = smtplib.SMTP(host='smtp.gmail.com', port=587)
                                s.starttls()
                                s.login("creditcardhelp456@gmail.com", "lasxsfstdsdxlirf")
                                msg = MIMEMultipart()  # create a message.........."
                                msg['From'] = "creditcardhelp456@gmail.com"
                                msg['To'] = email
                                msg['Subject'] = "OTP verification"
                                body = "Your OTP is:- - " + str(pswd)
                                msg.attach(MIMEText(body, 'plain'))
                                s.send_message(msg)
                                # otppage(oid,pwd)
                                otppage(pwd,q,lid)


                            else:
                                q=db.insert("insert into otp VALUES ('','"+lid+"','"+str(pswd)+"','pending')")
                                # oid=q['o_id']
                                pwd=str(pswd)

                                import smtplib
                                print("eeeeeeeeeeeeeeeeeeeee",email)

                                s = smtplib.SMTP(host='smtp.gmail.com', port=587)
                                s.starttls()
                                s.login("creditcardhelp456@gmail.com", "lasxsfstdsdxlirf")
                                msg = MIMEMultipart()  # create a message.........."
                                msg['From'] = "creditcardhelp456@gmail.com"
                                msg['To'] = email
                                msg['Subject'] = "OTP verification"
                                body = "Your OTP is:- - " + str(pswd)
                                msg.attach(MIMEText(body, 'plain'))
                                s.send_message(msg)
                                otppage(pwd,q,lid)
                        else:
                            print("Mail id unknown")

                    else:
                        print("Fraud detected")
                        return "no"

