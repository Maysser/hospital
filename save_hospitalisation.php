<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hospital_data_base";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id_patient = $_POST['id_patient'];
$id_medecin = $_POST['id_medecin'];
$date_admission = $_POST['date_admission'];
$service = $_POST['service'];

$sql = "INSERT INTO Hospitalisation (ID_Patient, ID_Medecin, DateAdmission, Service) 
        VALUES ('$id_patient', '$id_medecin', '$date_admission', '$service')";

if ($conn->query($sql) === TRUE) {
    echo "Hospitalisation ajoutée avec succès!";
} else {
    echo "Erreur: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
