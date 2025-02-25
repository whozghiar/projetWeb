


<!doctype html>
<html>
    <head>
    
    <link rel="icon" type="image/x-icon" href="https://www.flaticon.com/svg/static/icons/svg/3022/3022607.svg">
            <meta name= "viewport" content="width=device-width, initial-scale=1">
            <title>Candidature</title>
        <!-- 
        Ci dessous nous avons un script en JavaScript pour ajouter des membres à notre groupe.
        Il y a 3 champ qui sont ajouté à chaque fois qu'on appuie sur le bouton ajouter un membre: nomMembre, prenomMembre, Instrument.
        Il y a aussi une vérification pour ajouter un maximum de 8 membres. 
        Nous avons aussi mis un bouton supprimer un membre.
        -->
        {literal}
            <script type="text/JavaScript">
                <!--
                function ajouter(nbmembre) // Ajoute une ligne de champs
                {
		if ( typeof this.i == 'undefined' ) {
                        if (nbmembre!= 'undefined'){
                                this.i=nbmembre+1;
                        }else{
                             this.i = 2;  
                        }
                }
      
 
                var doc = document.getElementById('membres'); //élément parent
     
     
                const   label1 = document.createElement('label');
                        label1.innerText = "Membre n°"+i.toString()+" *";


                const   input1 = document.createElement('input');
                        input1.type = "text";
                        input1.name = "nomMembre[" + i.toString()+"]";
                        input1.placeholder = "Nom";
                        input1.required=true;

                const   input2 = document.createElement('input');
                        input2.type = "text";
                        input2.name = "prenomMembre[" + i.toString()+"]";
                        input2.placeholder = "Prenom";
                        input2.required=true;

                const   input3 = document.createElement('input');
                        input3.type = "text";
                        input3.name = "instrumentMembre[" + i.toString()+"]";
                        input3.placeholder = "Instrument";
                        input3.required=true;
           
                const   surplus = document.createElement('P');
                        surplus.innerText = "Nombre max de membre atteint";   
             
           
                //Ajouter les éléments
                i += 1;
     
                if(i==10){
                        doc.appendChild(surplus);
                } else if (i<10){
                        doc.appendChild(label1);
                        doc.appendChild(input1);
                        doc.appendChild(input2);
                        doc.appendChild(input3);
                }                
                }

                
                function supprimer(nbmembre){

                if ( typeof this.i == 'undefined' ) {
                        if (nbmembre!= 'undefined'){
                                this.i=nbmembre+1;
                        }
                }
                if ( typeof this.nb == 'undefined' ) {
                        if (nbmembre!= 'undefined'){
                                this.nb=nbmembre;
                        }else{
                                nb=1;
                        }
                }
                        var doc = document.getElementById('membres');
                        if(doc.childElementCount!=4){
                                if((nb==i-1)|((nb==8))){
                                        if(i>=10){
                                                for(var j=0;j<9;j++){
                                                        doc.removeChild(doc.lastChild);
                                                }
                                                i=8;
                                        }else{
                                                for(var j=0;j<8;j++){
                                                        doc.removeChild(doc.lastChild);
                                                }
                                                i--;
                                        }
                                        nb--;
                                }else{
                                        if(i>=10){
                                                for(var j=0;j<5;j++){
                                                        doc.removeChild(doc.lastChild);
                                                }
                                                i=8;
                                        }else{
                                                for(var j=0;j<4;j++){
                                                        doc.removeChild(doc.lastChild);
                                                }
                                                i--;
                                        }
                                }
                        } 
                }

                </script>
        {/literal}
        
        <link href="css/candidature.css" type="text/css" rel="stylesheet" >
    </head>
    <header>
        <a class="header" href="/codes">
        <img class="header" src="/images/home.png">
        </a>
    </header>
    <body>
    {if isset ($user)} <!-- On vérifie si la personne est bien connectée pour pouvoir fare une candidature -->
        {if ($candidat==1)} <!-- On vérifie si la personne a déjà fait une candidature, si il n'a pas fait de candidature il remplit les champs suivant -->
        <div class="fadeIn H">
            <h1> Candidature au festival : </h1>
        </div>

    <div class = "wrapper fadeInDown">
        <div id = "formContent">
            <form action="candidature" method="POST" enctype="multipart/form-data">
            
                <label class = "fadeIn second"> Nom du groupe :  * </label>
                <input class = "fadeIn second" 
                    type = "text"
                    name = "nomGrp"
                    placeholder= "Ex : !Ayya!"
                    value = "{$nomGrp|default:''}"
                    > <br> <span class="erreur"> {$messages.nomGrp|default:''} </span> <br> <br>
                
                    <label class = "fadeIn second"> Département : * <label> 
                        <select class = "fadeIn second"
                                required
                                type = "text"
                                name = "dep" required> 

                                {foreach $reqDep item=ligne}
                                    <option selected> {$ligne[0]}
                                    
                                {/foreach}
                        </select>
           
                <br>

                <label class = "fadeIn second"> Ville * </label>
                <input  class = "fadeIn second"
                        type = "text"
                        name="ville" 
                        placeholder= "Ex : Creil"
                        value="{$ville|default:''}"
                        required> <br> <span class="erreur"> {$messages.villeRep|default:''} </span> <br>

                <br>
           
                <label class = "fadeIn second"> Code Postal * </label>
                <input class = "fadeIn second" 
                    type = "number"
                    style="-moz-appearance: textfield"
                    name = "codePostal"
                    placeholder = "Ex : 60140"
                    value = "{$codePostal|default:''}"
                    required> <br> <span class="erreur"> {$messages.cp|default:''} </span> <br>
           
                <br>

                <label class = "fadeIn second"> Téléphone : * </label>
                <input class = "fadeIn second" 
                    type = "tel"
                    name="tel"
                    placeholder="Ex : 06 57 25 14 38"
                    pattern = "+33 [0-9]{10}"
                    value = "{$tel|default:''}"
                    required> <br> <span class="erreur"> {$messages.tel|default:''} </span> <br>
           
                <br>

                <label class = "fadeIn second"> Année de création du groupe : * </label>
                <input  class = "fadeIn second" 
                        type = "number"
                        name = "annee"
                        placeholder="Ex : 1998"
                        min = "1930"
                        max = "2021"
                        value = "{$annee|default:''}"
                        required> <br> <span class="erreur"> {$messages.anneeCrea|default:''} </span> <br>
          
                <br>

                <label class = "fadeIn second"> Scène : * </label>
                <select class = "fadeIn second"
                        required
                        type = "text"
                        name = "scene">
                    {foreach $reqScenes item = scene}
                        <option> {$scene[0]}
                    {/foreach}
                </select>
           
                <br>

                <label class = "fadeIn second"> Votre Style musical : * </label>
                <input  class = "fadeIn second"
                        type = "text"
                        name = "styleMus"
                        placeholder="Ex : Trance-rock"
                        value = "{$styleMus|default:''}"
                        required> <br> <span class="erreur"> {$messages.styleMus|default:''} </span> <br>
            
                <br>

                <label class = "fadeIn second"> Présentez vous (<500 caractères) : * </label>
                <textarea  class = "fadeIn second"
                        type="text"
                        maxlength = 500
                        name = "presTexte"
                        placeholder="Ex : Notre groupe est né lors d'une rencontre entre ..."
                        value = "{$presTexte|default:''}"
                        required></textarea> <br> <span class="erreur"> {$messages.presTexte|default:''} </span> <br>

                <br>

                <label class = "fadeIn third"> Votre expérience scénique (<500 caractères) : * </label>
                <textarea  class = "fadeIn third"
                        type = "text"
                        maxlength = 500
                        name = "expScenique"
                        placeholder="Ex : Le groupe participera a son 100ème concert..."
                        value = "{$expScenique|default:''}"
                        required></textarea> <br> <span class="erreur"> {$messages.expScenique|default:''} </span> <br>
           
                <br>

                <label class = "fadeIn third"> Lien vers votre site ou page Facebook|Twitter. * </label>
                <input  class = "fadeIn third"
                        type = "url"
                        name ="facebook"
                        placeholder="Ex : https://www.facebook.com/!Ayya!"
                        value = "{$facebook|default:''}"
                        required> <span class="erreur"> {$messages.urlFB|default:''} </span>
                <br>
                <br>

                <label class = "fadeIn third"> Lien vers votre Soundcloud.</label>
                <input  class = "fadeIn third"
                        type = "url"
                        name ="soundcloud"
                        placeholder="Ex : https://soundcloud.com/ytprodmusic/!Ayya!"
                        value = "{$soundcloud|default:''}"> <span class="erreur"> <br> {$messages.urlSC|default:''} </span> <br>
            
                <br>
                

                <label class = "fadeIn third"> Lien vers votre chaîne YouTube. </label>
                <input  class = "fadeIn third"
                        type = "url"
                        name ="youTube"
                        placeholder="Ex : https://www.youtube.com/c/!Ayya!"
                        value = "{$youTube|default:''}"> <br> <span class="erreur"> {$messages.urlYT|default:''} </span> <br>
            
                <br>
                
                <label class = "fadeIn third"> Membres </label>
                <div id="membres">
                        {if isset ($membreLength)}
                                {for $i=1 to $membreLength}
                                        <label> Membre n°{$i} * </label>
                                        <input
                                        type = "text"
                                        name ="nomMembre[{$i}]"
                                        placeholder="Nom"
                                        value = "{$nomMembre[{$i}]|default:''}"
                                        required>
                                        <input
                                        type = "text"
                                        name ="prenomMembre[{$i}]"
                                        placeholder="Prenom"
                                        value = "{$prenomMembre[{$i}]|default:''}"
                                        required>
                                        <input
                                        type = "text"
                                        name ="instrumentMembre[{$i}]"
                                        placeholder="Instrument"
                                        value = "{$instrumentMembre[{$i}]|default:''}"
                                        required>
                                {/for}
                        {else}
                                <label> Membre n°1 * </label>
                                <input
                                type = "text"
                                name ="nomMembre[1]"
                                placeholder="Nom"
                                value = "{$nomMembre[1]|default:''}"
                                required>
                                <input
                                type = "text"
                                name ="prenomMembre[1]"
                                placeholder="Prenom"
                                value = "{$prenomMembre[1]|default:''}"
                                required>
                                <input
                                type = "text"
                                name ="instrumentMembre[1]"
                                placeholder="Instrument"
                                value = "{$instrumentMembre[1]|default:''}"
                                required>
                        {/if}
		</div>
                <span class="erreur"> {$messages.membre|default:''} </span>
                <br>
                <input type="button" value="Ajouter un membre" onClick="javascript:ajouter({if isset ($membreLength)} {$membreLength} {else} 'undefined' {/if})">
                <input type="button" value="Supprimer un membre" onClick="javascript:supprimer({if isset ($membreLength)} {$membreLength} {else} 'undefined' {/if})">
                <br>
                <br>
                
                <label class = "fadeIn third"> Avez-vous un statut associatif ? * </label>
                <input  class = "fadeIn third"
                        required
                        type = "radio"
                        name ="statut"
                        value = "Oui"
                        >
                        Oui
                <input  class = "fadeIn third"
                        required
                        type = "radio"
                        name = "statut"
                        value = "Non" 
                        checked>
                        Non
            
                <br>
                <br>
                <br>

                <label class = "fadeIn third"> Êtes-vous inscrits à la SACEM ? * </label>
                <input  class = "fadeIn third"
                        required
                        type = "radio"
                        name ="sacem"
                        value = "Oui">
                        Oui
                <input  class = "fadeIn third"
                        required
                        type = "radio"
                        name = "sacem"
                        value = "Non" 
                        checked>
                        Non

                <br>
                <br>
                <br>
           
                <label class = "fadeIn third"> Votre groupe est-il sous contrat d'un producteur ? * </label>
                <input  class = "fadeIn third"
                        required
                        type = "radio"
                        name ="producteur"
                        value = "Oui">
                        Oui
                <input  class = "fadeIn third"
                        required
                        type = "radio"
                        name = "producteur"
                        value = "Non" 
                        checked>
                        Non

                <br>
                <br>
           
                <label class = "fadeIn fourth"> Dossier de presse (PDF) : </label>
                <input  class = "fadeIn fourth"
                        name = "dossierPresse"
                        type="file"> 
                <br>
                <span class="erreur">  {$messages.dossierPresse|default:''} </span>

                <input  type = "hidden"
                        name ="MAX_FILE_SIZE"
                        value ="25000000">
                

                <br>
                <br>
           
                <label class = "fadeIn fourth"> Fiche Technique (PDF) : * </label>
                <input  class = "fadeIn fourth"
                        required
                        name = "ficheTechnique"
                        type="file">
                <br>
                <span class="erreur"> {$messages.ficheTechnique|default:''} </span>

                <input  type = "hidden"
                        name ="MAX_FILE_SIZE"
                        value ="25000000">
                

                <br>    
                <br>
            
                <label class = "fadeIn fourth"> Document SACEM (PDF) : * </label>
                <input  class = "fadeIn fourth"
                        required
                        name = "sacem"
                        type="file">
                <br>
                <span class="erreur"> {$messages.sacem|default:''} </span>
                <input  type = "hidden"
                        name ="MAX_FILE_SIZE"
                        value ="25000000">
                        
               

                <br>
                <br>

                <label class = "fadeIn fourth"> Insérez deux Photos du groupe (Résolution > 300 DPI) * </label>
                <br>
                <input  class = "fadeIn fourth"
                        required
                        name = "photoGrp1"
                        type = "file">   
                <br>  <span class="erreur"> {$messages.photoGrp1|default:''} </span> <br>

                <br>
                <input  class = "fadeIn fourth"
                        required
                        name = "photoGrp2"
                        type = "file"> <br>  <span class="erreur">  {$messages.photoGrp2|default:''} </span> <br>

                <br>

                <label class = "fadeIn fourth"> Ajoutez 3 extraits de vos musiques en .MP3 * </label>
                <br>
                <input  class = "fadeIn fourth"
                        required
                        name = "mus1"
                        type = "file"> <br>  <span class="erreur">  {$messages.mus1|default:''} </span> <br>
                <br>
                <input  class = "fadeIn fourth"
                        required
                        name = "mus2"
                        type = "file"> <br>  <span class="erreur"> {$messages.mus2|default:''} </span> <br>
                <br>
                <input  class = "fadeIn fourth"
                        required
                        name = "mus3"
                        type = "file">
                <br> <span class="erreur"> {$messages.mus3|default:''} </span>
           
                <input type ="submit">
            
        </div>
    </div>
        

</form>


        {else}  <!-- si Il y a déjà une candidature alors il y a un bouton pour voir sa candidature -->
        <div class="fadeIn H">
                <h1> Vous avez déjà fait une candidature.</h1>
        
       
        <br>
        
                 <a href = "detail_candidature">Voir ma candidature</a>
        </div>
         {/if}


{else}


        
        <div class="fadeIn H"> <!-- on gère aussi le cas où la personne à mis le lien vers candidature sans être connectée  -->
                <h1> Vous devez être connectés pour pouvoir candidater.</h1>
        
       
        <br>
        
                 <a href = "login"> Se connecter</a>
        </div>
         <br>
        

        
{/if}
    </body>
</html>

        
