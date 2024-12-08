<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hospital_data_base";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$nom = $_POST['nom'];
$forme = $_POST['forme'];
$dosage = $_POST['dosage'];
$effets = $_POST['effets'];
$description = $_POST['description'];
$date_peremption = $_POST['date_peremption'];

$sql = "INSERT INTO Medicament (Nom, Forme, Dosage, EffetsSecondaires, Description, DatePeremption) 
        VALUES ('$nom', '$forme', '$dosage', '$effets', '$description', '$date_peremption')";

if ($conn->query($sql) === TRUE) {
    echo "Médicament ajouté avec succès!";
} else {
    echo "Erreur: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
