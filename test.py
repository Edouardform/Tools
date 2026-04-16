#### import des modules ####
from tkinter import *
import os

#### Fonction ####
def install():
    select=[]
    #for soft in listcheck:
    #listcheck:
    if checkbtn.get() == 1:
        #select.append(soft)
        #print(soft, checksoft.cget("text"))
        print(checksoft.cget("text"))
                #(subprocess.run([pathsoft\checkbtn.get("text")]) )

#### interface principale ####
main = Tk()
main.title("Install Tool")
main.geometry("500x500")

#### label interface principale ####
mainlbl = Label(main, text = "Cocher les applications à installer :")
mainlbl.place(x=10, y=10)

#### listing des applications et créations des cases à cocher ####
pathsoft = "C://Users//Proprietaire//Downloads//Install"
finalpath = os.listdir(pathsoft)
i = 20
listcheck = []
for s in finalpath:
    checkbtn = IntVar()
    checksoft = Checkbutton(main, text=s, variable=checkbtn)
    i += 20
    checksoft.place(x=10 , y=i)
    listcheck.append(s)
    #print(checksoft.cget("text"))
### list checkbutton ###


#### bouton installation  #####
btninstall= Button(main, text = "Installer", command= install)
btninstall.place(x=10, y=470)


#### bouton fermer ####
btnclose = Button(main, text = "Annuler", command= main.destroy)
btnclose.place(x=440, y=470)








#### appel de l'interface principale ####
main.mainloop()