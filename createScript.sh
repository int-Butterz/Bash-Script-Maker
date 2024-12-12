echo "Enter the name of your bash script (without the '.sh' at the end)"
read nom
touch ./$nom.sh | sudo chmod u+x $nom.sh
#------------------------------------
confirm=F
while [[ $confirm = F ]]; do
        echo "Can anyone use it? Or just yourself ( A(all) / S(self) )"
        read choice0
        if [[ $choice0 = A || $choice0 = a ]]; then
                sudo chmod a+x $nom.sh && echo "Everyone can use it!" || echo "Error"
                confirm=T
        elif [[ $choice0 = S || $choice0 = s ]]; then
                sudo chmod u+x $nom.sh && echo "Only you can use it!" || echo "Error"
                confirm=T
        else
                echo $invalid
        fi
done
#-----------------------------------
confirm=F
while [[ $confirm = F ]]; do
        echo "Do you want it to use anywhere? (Y/N)"
        read choice2
        if [[ $choice2 = Y || $choice2 = y ]]; then
                sudo mv ./$nom.sh /usr/bin && echo "$nom.sh has been created and moved to /usr/bin!" || echo "Error"
                confirm=T
        elif [[ $choice2 = N || $choice2 = n ]]; then
                while [[ $confirm = F ]]; do
                        echo "Do you want to call the interpreter to use it? (Y/N)"
                        read choice3
                        if [[ $choice3 = N || $choice3 =  n ]]; then
                                echo "#!/bin/bash" > $nom.sh && echo "Now it can be called just by putting ./" || echo "Error"
                                confirm=T
                        elif [[ $choice3 = Y || $choice3 = y ]]; then
                                echo "Don't forget to use 'bash' when calling the script!"
                                confirm=T
                        else
                                echo $invalid
                        fi
                done
        else
                echo $invalid
        fi
done
#-------------------------------------
confirm=F
while [[ $confirm = F ]]; do
        echo "Would you like to edit it now? (Y/N)"
        read choice1
        if [[ $choice1 = Y || $choice1 = y ]]; then
                if [[ $choice2 = Y || $choice2 = y ]]; then
                        sudo nano /usr/bin/$nom.sh
                        confirm=T
                else
                        sudo nano $nom.sh
                        confirm=T
                fi
        elif [[ $choice1 = N || $choice1 = n ]]; then
                confirm=T
        else
                echo $invalid
        fi
done
#------------------------
echo "Your script has been succesfully created!"
