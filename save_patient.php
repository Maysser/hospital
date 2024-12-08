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
$prenom = $_POST['prenom'];
$date_naissance = $_POST['date_naissance'];
$sexe = $_POST['sexe'];
$adresse = $_POST['adresse'];
$telephone = $_POST['telephone'];
$taille = $_POST['taille'];
$poids = $_POST['poids'];
$groupe_sanguin = $_POST['groupe_sanguin'];
$antecedents = $_POST['antecedents'];
$carte_soins = isset($_POST['carte_soins']) ? 1 : 0;
$date_admission = $_POST['date_admission'];

// Prepare the SQL query with placeholders
$stmt = $conn->prepare("INSERT INTO patient 
    (Nom, Prénom, DateNaissance, Sexe, Adresse, Téléphone, taille, poids, Groupe_sanguin, Antécedents, Cartes_Soins, Date_admission) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

// Bind parameters to the prepared statement
$stmt->bind_param("ssssssssssss", $nom, $prenom, $date_naissance, $sexe, $adresse, $telephone, $taille, $poids, $groupe_sanguin, $antecedents, $carte_soins, $date_admission);

// Execute the statement
if ($stmt->execute()) {
    echo "New record created successfully";
} else {
    echo "Error: " . $stmt->error;
}

// Close the statement and connection
$stmt->close();
$conn->close();

?>
