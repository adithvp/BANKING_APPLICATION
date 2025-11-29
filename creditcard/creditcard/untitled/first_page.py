import sys
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from DBConnection import Db
from camera import abc

class abcd:
	def __init__(self):
		app = QApplication(sys.argv)
		win = QWidget()
		win.setWindowTitle("Secure Banking")
		win.setGeometry(600, 350, 600, 200)
		self.e1 = QLineEdit()
		self.e1.setValidator(QIntValidator())
		self.e1.setAlignment(Qt.AlignRight)
		self.e1.setFont(QFont("Arial", 16))


		flo = QFormLayout()
		flo.setAlignment(Qt.AlignCenter)
		flo.addRow("Enter you card number", self.e1)

		e6 = QPushButton("NEXT")
		e6.setStyleSheet("background:#000;color:#fff;")
		e6.clicked.connect(self.enterPress)
		flo.addRow( e6)

		self.e7 = QLabel("Invalid card number")
		self.e7.setStyleSheet("color:#f00;font-size:18px;")
		self.e7.hide()
		flo.addRow( self.e7)

		win.setLayout(flo)
		win.setWindowTitle("PyQt")
		win.show()

		sys.exit(app.exec_())



	def enterPress(self):
		card_no=self.e1.text()
		print(card_no)
		db=Db()
		res=db.selectOne("select * from atm where card_no='"+card_no+"'")
		print(res)
		if res is None:
			self.e7.show()
		else:
			self.e7.hide()
			obj=abc()
			obj.check_face(res['c_id'])

if __name__ == '__main__':
	obj=abcd()
	obj.window()