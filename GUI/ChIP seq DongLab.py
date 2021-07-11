#!/usr/bin/python
#-*- coding=utf-8 _*_ #编码格式语言是中文
import sys

reload(sys)
sys.setdefaultencoding('utf8')

#from PyQt5 import QtGui
#这里我们提供必要的引用。基本控件位于pyqt5.qtwidgets模块中。
from PyQt5.QtWidgets import QApplication, QWidget
#from PyQt5 import QtWidgets
app = QtWidgets.QApplication(sys.argv) # QApplication生成App对象，sys.argv表示该App程序可以用用命令行的方式是想
widget = QtWidgets.QWidget()#QWidget生成一个窗口
widget.resize(550,550)#设置窗口大小
widget.setWindowTitle(u'RNA-Seq Apps For Donglab')#设置App的标题
widget.show()#显示窗口
sys.exit(app.exec_() )#关闭窗口
