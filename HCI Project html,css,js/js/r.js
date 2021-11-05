function validasi() {

    var nama = document.getElementById("nama").value;
    var telephone = document.getElementById("telephone").value;
    var alamat = document.getElementById("alamat").value
    var quantity = document.getElementById("quantity").value
    var product = document.getElementById("product").value

    var errormsg = document.getElementById("errormsg")


    if (!validasiNama(nama)) {
        errormsg.innerText = "Name is not valid"
    } else if (!telponValidation(telephone)){
        errormsg.innerText = "Telephone is not valid"
    } 

    else if (!alamatValidation(alamat)){
         errormsg.innerText = "Address is not valid"
    } 

    else if(quantity == "") {
        errormsg.innerText = "Quantity is not valid"
    } 

    else if (!(product == "Vixian" || product == "Kawasako")){
        errormsg.innerText = "Product is not Valid"
    } 

    else {
        alert("Data Input is Correct")
        return true;
    }
}


//nama tidak boleh kosong dan 
//validasi agar tidak ada angka
function validasiNama (nama) {
    if (nama == "") {
        return false;
    } else {
        for (var i = 0; i < nama.length; i++) {
            if((nama[i] >='0' && nama[i] <= '9')) {
                return false;
            }
        }
        return true;
    }
}

//telepon kurang dari 4 
//dan harus angka
function telponValidation (telephone) {
    if (telephone.length < 4) {
        return false;
    } else {
        for (var i = 0; i < telephone.length; i++) {
            if (!(telephone[i] >= '0' && telephone[i] <= '9')) {
                return false;
            }
        }
       return true; 
    }
}

//alamat tidak boleh kosong
function alamatValidation (alamat) {
    if (alamat == "") {
        return false;
    } else return true;
}