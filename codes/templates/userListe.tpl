<!doctype html>
<html>
    <head>
        <link href="css/index.css" type="text/css" rel="stylesheet" >
        <link rel="icon" type="image/x-icon" href="https://www.flaticon.com/svg/static/icons/svg/3022/3022607.svg">
	    <link href="css/liste_candid.css" type="text/css" rel="stylesheet" >
            <meta name= "viewport" content="width=device-width, initial-scale=1">
            <title>Liste des utilisateurs</title>
    </head>
    <header>
        <a class="header" href="/codes">
        <img class="header" src="/images/home.png">
        </a>
    </header>
    <body>
        <div class="fadeIn H">
            <div class="page-title-holder">
                <h1> Liste des utilisateurs </h1>
            </div>
            <form action="userListe" method="POST" enctype="multipart/form-data" >
            <table class="Table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Mail</th>
                        <th>Candidature</th>
                        <th>Type</th>
                    </tr>
                <thead>

                
                <tbody>
                {foreach $users item = infoUser} <!-- Pour chaque utilisateur -->
                    <tr>
                    <td>{$infoUser[5]}</td> <!-- Affiche l'id -->
                    <td>{$infoUser[0]}</td> <!-- Affiche le nom -->
                    <td>{$infoUser[1]}</td> <!-- Affiche le prénom -->
                    <td>{$infoUser[2]}</td> <!-- Affiche le mail -->
                    <td>{if $infoUser[4]==0} <a class="userButton" href="detail_candidature/{$infoUser[5]}">Voir</a>{else} Aucune {/if} </td>  <!-- Affiche un bouton vers la candidature si l'utilisateur en possède une, sinon il est affiché 'Aucune'-->
                    <td>{if $infoUser[3]=="Administrateur"}<!-- Si l'utilisateur est Administrateur -->
                        {$infoUser[3]}
                        {else}<!--  -->
                        <select
                                    required
                                    type = "text"
                                    name = "type[{$infoUser[5]}]" required> 
                                    {if $infoUser[3]=="Responsable"}
                                    <option> Administrateur
                                    <option selected> Responsable
                                    <option> Candidat
                                    {else}
                                    <option> Administrateur
                                    <option> Responsable
                                    <option selected> Candidat
                                    {/if}
                                    
                        </select>
                        {/if}
                    </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
            <br>
            <input type ="submit">
            </form>
        </div>

