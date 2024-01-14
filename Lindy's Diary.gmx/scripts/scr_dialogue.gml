///Begin dialogue between player and messageGiver
//Create the dialogue box in the middle of the screen
dialogueBox = instance_create(240 , 160, obj_dialogbox);
if messageGiver.object_index == obj_Emilia {
    dialogueBox.sprite_index = spr_Emila_Dialog_Box
}
if messageGiver.object_index == obj_Emi {
    dialogueBox.sprite_index = spr_Emi_Dialog_Box
}
if messageGiver.object_index == obj_Cicilia {
    dialogueBox.sprite_index = spr_Cicilia_Dialog_Box
}
if messageGiver.object_index == obj_Sam {
    dialogueBox.sprite_index = spr_Sam_Dialog_Box
}

//With allows us to access the variables of dialogueBox with an accessor (.) each time
with(dialogueBox) {
    //Set the variables of the box created
    maxLength = sprite_width - 48; //The text won't flow beyond the edges of our sprite
    maxHeight = sprite_height - 48; //The text won't flow out of the edges of our sprite
    myMessage = messageGiver.myDialogue[index1, index2]; //Grab the message from the messageGiver
    messageIndex = 0; //Start at 0 with the message to display in the dialogueBox
    //Checking to see if there are any choices for the player to choose from after the NPC talks
    if(array_length_2d(messageGiver.myDialogue, index1) > 1)
        hasChoices = true;
    else
        hasChoices = false;
    //Splits the message from the NPC up into multiple parts, if it's too long
    if(string_height_ext(myMessage, 12, maxLength) > maxHeight) {
        textHeight = string_height_ext(messageGiver.myDialogue[index1, index2], 12, maxLength); //Get how high the message is going to be
        amount = (textHeight / (sprite_height - 48));; //Divide that, and then know how many parts need to be created
        startingAt = 0; //Always begin at 0
        for(i = 0; i < amount; ++i) {
            //The first message to display is at the beginning, and goes until amount
            myMessage[i] = string_copy(messageGiver.myDialogue[index1, index2], startingAt, (string_length(messageGiver.myDialogue[index1, index2])) / amount);
            //Then update where to start, so it begins where the last message left off
            startingAt = string_length(messageGiver.myDialogue[index1, index2]) / amount;
        }
    }
    //If it's not too long, then just take the message and set it for index 0 of myMessage
    else
        myMessage[messageIndex] = messageGiver.myDialogue[index1, index2];
    //These variables are used to display the message one letter at a time, just need to be initialized
    currentText = "";
    position = 0;
    
}