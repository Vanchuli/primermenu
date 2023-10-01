#!bin/bash

# Funcion para mostrar el menú // menu display function

function display_menu () {

echo "Menu: "
echo "1. Create a new contact"  # Crea un nuevo contacto invocando a la function CreateContact
echo "2. Search a contact" # Busca un contacto existente en el archivo contacts.txt con la function SearchContact
echo "3. Help" # Muestra ayuda de qué hace cada opcion
echo "4. Exit"  #Sale del programa terminando con el bucle 

}

# Function para crear un nuevo contacto 

function create_contact () {

echo "Enter your name: "
read name
echo "Enter your lastname: "
read lastname 
echo "Enter your email: " 
read email
echo "Enter your phone: "
read phone


}

# Function para guardar contacto en contactos.txt 


function save_contact () {

echo "$contact" > "$contacts.txt"  #como creo una variable contact para que se me guarden todos los datos???

}

# Function para verificar si existe contacto en contactos.txt

function verf_contact () {

local contact= "$1"
if grep -Fxq "$contact" "$contacts_txt"; then 
echo "This contact already exists" 
else 
echo "New contact will be added"
save_contact "$contact" 

fi 

}

# Function para buscar contacto en contactos.txt

function search_contact () {


if grep -q "$contact" "$contacts.txt"; then

echo "Contact already exists"
else
echo "Contact not found"
fi
}

function select_option () {

case $1 in  

1) 

echo "Create a new contact: "
create_contact
;;

2) 

echo "Search a contact: " 
search_contact
;;

3)

echo "Help: "
echo "option 1 - Create a new contact: Create a new contact and stores it in contacts.txt"
echo "option 2 - Search a contact: search a contact in contacts.txt"
echo "to exit the menu press 4"
;;

4)

echo "Press 4 to exit: "
exit 0
;;

*) 

echo "invalid option. Try again with another number"
;;

esac

}


# Bucle con while 

while true; do 

display_menu 
echo -n "Choose option: "
read option
select_option "$option"
read -r
create_contact 
read -r 
search_contact 

done
