#!bin/bash 

#Funcion para mostrar el menú / menu display function

function display_menu () {

echo "Menu: "
echo "1.Create a new contact" #Crea un nuevo contacto invocando a la funcion CreateContact
echo "2.Search a contact" # Busca un contacto existente en el archivo contacts.txt con la funcion SearchContact
echo "3.Help" # Muestra ayuda de como y que hace cada opcion
echo "4. Exit" # Sale del programa terminando con el bucle 

}

#Funcion para crear nuevo contacto / createContact function 

function create_contact () {

echo "Enter your name: "
read name
echo "Enter your lastname: "
read lastname
echo "Enter your email: "
read email
echo "Enter your phone: "
read phone 


declare -a contacto=("$name", "$lastname", "$email", "$phone")
contact=${contacto[@]}
echo $contact >> contacts.txt
echo "Contacto creado satisfactoriamente"
exit 0
}

#Funcion para verificar si existe contacto en contacts.txt

function verf_contact () {

local contact= "$1"
if grep -Fxq "$contact" "$contacts_txt";then
echo "This contacto already exists"
else 
echo "New contact will be added"
save_contact "$contact"
fi
}

#Function para buscar contacto en contacts.txt

function search_contact () {

echo "Enter your contact's email or phone"
read emailorphone
if grep -q "$emailorphone" contacts.txt; then
echo "Contact already exists"
exit 0
else 
echo "Contact not found"
exit 1
fi
}

#Funcion para seleccionar la opcion que quiera el usuario

function select_option () {

case $1 in 

1)
echo "Create a new contact"
create_contact
;;

2)
echo "Search a contact"
search_contact
;;

3) 
echo "Help:"
echo "Option 1: Create  a new contact and stores it in contacts.txt"
echo "Option 2: Search a contact in contacts.txt"
echo "TO exit the menu press option 4"
;;

4)

echo "Press 4 to exit"
exit 0
;;

*)

echo "Invalid option. Try again with another number"
;;

esac
}

#Bucle con while


while true;do
display_menu
echo -n "Choose option"
read option
select_option "$option"
read -r
create_contact 
read -r
search_contact
done 





