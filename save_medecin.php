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
$specialite = $_POST['specialite'];
$telephone = $_POST['telephone'];
$email = $_POST['email'];

// Prepare the SQL query with placeholders
$stmt = $conn->prepare("INSERT INTO médecin (Nom, Prénom, Spécialité, Téléphone, Email) 
                        VALUES (?, ?, ?, ?, ?)");

// Bind parameters to the prepared statement
$stmt->bind_param("sssss", $nom, $prenom, $specialite, $telephone, $email);

// Execute the statement
if ($stmt->execute()) {
    echo "Médecin ajouté avec succès!";
} else {
    echo "Erreur: " . $stmt->error;
}

// Close the statement and connection
$stmt->close();
$conn->close();

?>
