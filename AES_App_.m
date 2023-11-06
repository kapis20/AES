classdef AES_App_ < matlab.apps.AppBase

    %The Dashboard app to interact with the AES algorithm 
    %written by K Sikorski 

    % Properties that correspond to app components
    properties (Access = public)
        AESInspectorUIFigure        matlab.ui.Figure
        TabGroup                    matlab.ui.container.TabGroup
        InspectorTab                matlab.ui.container.Tab
        OutputinHexEditField        matlab.ui.control.EditField
        OutputinHexEditFieldLabel   matlab.ui.control.Label
        SelectOperationButtonGroup  matlab.ui.container.ButtonGroup
        JunkButton                  matlab.ui.control.RadioButton
        DecryptionButton            matlab.ui.control.RadioButton
        EncryptionButton            matlab.ui.control.RadioButton
        EnterButton_2               matlab.ui.control.StateButton
        CipherKeyEditField          matlab.ui.control.EditField
        CipherKeyEditFieldLabel     matlab.ui.control.Label
        EditField_2                 matlab.ui.control.EditField
        OutputTextArea_2            matlab.ui.control.TextArea
        OutputTextArea_2Label       matlab.ui.control.Label
        YourKeyTextArea             matlab.ui.control.TextArea
        YourKeyTextAreaLabel        matlab.ui.control.Label
        InputStateTextArea          matlab.ui.control.TextArea
        InputStateTextAreaLabel     matlab.ui.control.Label
        EnterButton                 matlab.ui.control.StateButton
        EditField                   matlab.ui.control.EditField
        InputMessageEditField       matlab.ui.control.EditField
        InputMessageEditFieldLabel  matlab.ui.control.Label
        TextArea                    matlab.ui.control.TextArea
        InstructionsTab             matlab.ui.container.Tab
        Image5                      matlab.ui.control.Image
        Image4                      matlab.ui.control.Image
        TextArea_4                  matlab.ui.control.TextArea
        Image3                      matlab.ui.control.Image
        TextArea_3                  matlab.ui.control.TextArea
        Image2                      matlab.ui.control.Image
        TextArea_2                  matlab.ui.control.TextArea
        AESInspectorPanel           matlab.ui.container.Panel
        Image                       matlab.ui.control.Image
    end

    
    properties (Access = private)
        InputMessage; % property to store the value from the input message 
        ConvertedInput; %property to store converted input
        InputChecker; %property used to collect information about validation
        %of the input
        ConvertedDisplay; %property to store converted values to display
        CipherKey; %property to store a cipher key
        InputCheckTest; %property to store the value under test 
        ConvertedCipherKey; %property to store converted 4x4 matrix of cipher
        KeyAndMessageChecker; % property to store information whether both inputs are stored
        OutputMessage; %property to stoe the output of the AES operation
        ConvertedOutput; %property to store the converted to 4x4 matrix output
         
    end
    
    methods (Access = private)
        
        function InputCheck(app)
            %function designed to check wheter the valid characters are
            %inputted
            % Define valid characters (0-9, a-f, A-F)
            validCharacters = ['0':'9' 'a':'f' 'A':'F'];
            
            %check if the pressed key is not valid member 
            if ~ismember(app.InputCheckTest,validCharacters);
              InvalidInputWarning(app);
              app.InputMessage = '';
              app.InputChecker = 0;
              
            else 
                app.InputChecker = 1;
            end
        end
    
        function InvalidInputWarning(app)
            %warning window for invalid input
        opts = struct('WindowStyle','modal',... 
              'Interpreter','tex');
        f = warndlg('\color{blue}Some of the characters are not in the hexadecimal. Please enter a new value.',...
            'Invalid Input', opts);
        end

        function InvalidLenghtWarning(app)
            %warning window for invalid lenght of the message 
            opts1 = struct('WindowStyle','modal',... 
              'Interpreter','tex');
            f1 = warndlg('\color{blue}The inputted value does not contain 16 bytes. Please enter a new value.',...
            'Invalid Input', opts1);
        end

        function MissingKeyOrInput(app)
            %warning window for invalid lenght of the message 
            opts2 = struct('WindowStyle','modal',... 
              'Interpreter','tex');
            f2 = warndlg('\color{blue}Either the key or message is missing. Please enter valid input and try again.',...
            'Missing Input', opts2);
        end

        function ConversionForTextArea(app)
            %necessary conversions needed for display 
            app.ConvertedDisplay = num2str(app.ConvertedDisplay);
            app.ConvertedDisplay =cellstr(app.ConvertedDisplay);
        end
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            %functions that is executed when app is starting 
            %asssign zeros initially to avoid any bugs 
            app.KeyAndMessageChecker = zeros(1,2);
           
        end

        % Value changed function: InputMessageEditField
        function InputMessageEditFieldValueChanged(app, event)
            %read and store the input message for the furter use
            app.InputMessage = app.InputMessageEditField.Value;
                    
        end

        % Value changed function: EnterButton
        function EnterButtonValueChanged(app, event)
            %value = app.EnterButton.Value;
            %test if the entered value is in hex
            app.InputCheckTest = app.InputMessage;
            InputCheck(app);
            
            if app.InputChecker == 1
                %if input is valid get size ot the input message
                if length(app.InputMessage) == 32
                   %Convert the input to a state 4x4 Matrix 
                  app.ConvertedInput = conversion(app.InputMessage,0);
                  app.ConvertedDisplay = app.ConvertedInput;
                  ConversionForTextArea(app);
                  app.InputStateTextArea.Value = app.ConvertedDisplay;
                  %store one if valid input
                  app.KeyAndMessageChecker(1,1) = 1;
                else
                  InvalidLenghtWarning(app);  
                  app.KeyAndMessageChecker(1,1) = 0;
                  app.InputStateTextArea.Value ='';
                  app.InputMessageEditField.Value ='';
                end
               
            end
   
        end

        % Value changed function: CipherKeyEditField
        function CipherKeyEditFieldValueChanged(app, event)
            %store the cipher key 
            app.CipherKey = app.CipherKeyEditField.Value;
            
        end

        % Value changed function: EnterButton_2
        function EnterButton_2ValueChanged(app, event)
            %value = app.EnterButton_2.Value;
            %check if the entered value is in hex
            app.InputCheckTest = app.CipherKey;
            InputCheck(app);

            if app.InputChecker == 1
                %if input is valid get size ot the input key
                if length(app.CipherKey) == 32
                   %Convert the input to a state 4x4 Matrix 
                  app.ConvertedCipherKey = conversion(app.CipherKey,0);
                  app.ConvertedDisplay = app.ConvertedCipherKey;
                  ConversionForTextArea(app);
                  app.YourKeyTextArea.Value = app.ConvertedDisplay;
                  app.KeyAndMessageChecker(1,2) = 1;
                else
                  InvalidLenghtWarning(app);  
                  app.KeyAndMessageChecker(1,2) = 0;
                  app.YourKeyTextArea.Value ='';
                  app.CipherKeyEditField.Value = '';
                end
               
            end

            
        end

        % Selection changed function: SelectOperationButtonGroup
        function SelectOperationButtonGroupSelectionChanged(app, event)
            %get input from the user and assign it to choice
            selectedButton = app.SelectOperationButtonGroup.SelectedObject;
            selectedButton = selectedButton.Text;
            %Check if Cipher Key and Input message were added and are
            %valid
            
            if (app.KeyAndMessageChecker(1,1) == 1 && app.KeyAndMessageChecker(1,2) == 1)
                switch selectedButton
                    case 'Encryption'
                        choice = 0;
                        
                    case 'Decryption'
                        choice = 1;
                end
                app.OutputMessage = main(app.InputMessage,app.CipherKey, choice);
                app.ConvertedOutput = conversion(app.OutputMessage,0);
                app.ConvertedDisplay = app.ConvertedOutput;
                ConversionForTextArea(app);
                app.OutputTextArea_2.Value = app.ConvertedDisplay;
                app.OutputinHexEditField.Value = app.OutputMessage;
                app.InputMessageEditField.Value ='';
                app.KeyAndMessageChecker(1,1) = 0;

            else
                MissingKeyOrInput(app);
                app.JunkButton.Value=1;
                
            end
             
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create AESInspectorUIFigure and hide until all components are created
            app.AESInspectorUIFigure = uifigure('Visible', 'off');
            app.AESInspectorUIFigure.Color = [0.302 0.7451 0.9333];
            app.AESInspectorUIFigure.Position = [100 100 688 572];
            app.AESInspectorUIFigure.Name = 'AES Inspector';
            app.AESInspectorUIFigure.Icon = fullfile(pathToMLAPP, 'Pics', 'sq_logo.jpg');

            % Create AESInspectorPanel
            app.AESInspectorPanel = uipanel(app.AESInspectorUIFigure);
            app.AESInspectorPanel.ForegroundColor = [0.2588 0 0.6];
            app.AESInspectorPanel.TitlePosition = 'centertop';
            app.AESInspectorPanel.Title = 'AES Inspector';
            app.AESInspectorPanel.BackgroundColor = [0.3294 0.6 0];
            app.AESInspectorPanel.FontSize = 26;
            app.AESInspectorPanel.Position = [1 533 687 40];

            % Create Image
            app.Image = uiimage(app.AESInspectorPanel);
            app.Image.Position = [13 -24 109 90];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'Pics', 'UOSLogo_Primary_Violet_RGB.png');

            % Create TabGroup
            app.TabGroup = uitabgroup(app.AESInspectorUIFigure);
            app.TabGroup.Position = [1 1 688 533];

            % Create InspectorTab
            app.InspectorTab = uitab(app.TabGroup);
            app.InspectorTab.Title = 'Inspector';
            app.InspectorTab.BackgroundColor = [0.0706 0.6196 1];

            % Create TextArea
            app.TextArea = uitextarea(app.InspectorTab);
            app.TextArea.Editable = 'off';
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.FontName = 'Arial';
            app.TextArea.Position = [37 412 614 81];
            app.TextArea.Value = {'AES Inspector is a tool utilised for inspecting and analyzing Advanced Encryption Standard (AES) encryption. This app was designed to assist users in comprehending and addressing issues regarding encrypted data. It was developed by students from the University of Sheffield: Kacper Sikorski, Charlie Baldwin, and Boon Kean Teo.'; ''; 'The app should be self-explanatory, but please refer to the instructions tab if in doubt. '};

            % Create InputMessageEditFieldLabel
            app.InputMessageEditFieldLabel = uilabel(app.InspectorTab);
            app.InputMessageEditFieldLabel.HorizontalAlignment = 'right';
            app.InputMessageEditFieldLabel.Position = [51 345 84 22];
            app.InputMessageEditFieldLabel.Text = 'Input Message';

            % Create InputMessageEditField
            app.InputMessageEditField = uieditfield(app.InspectorTab, 'text');
            app.InputMessageEditField.CharacterLimits = [0 32];
            app.InputMessageEditField.ValueChangedFcn = createCallbackFcn(app, @InputMessageEditFieldValueChanged, true);
            app.InputMessageEditField.Position = [150 345 310 22];

            % Create EditField
            app.EditField = uieditfield(app.InspectorTab, 'text');
            app.EditField.Editable = 'off';
            app.EditField.Position = [115 380 457 22];
            app.EditField.Value = 'Please type 16 byte hex string with your input message below and press enter.';

            % Create EnterButton
            app.EnterButton = uibutton(app.InspectorTab, 'state');
            app.EnterButton.ValueChangedFcn = createCallbackFcn(app, @EnterButtonValueChanged, true);
            app.EnterButton.Text = 'Enter';
            app.EnterButton.Position = [459 345 100 23];

            % Create InputStateTextAreaLabel
            app.InputStateTextAreaLabel = uilabel(app.InspectorTab);
            app.InputStateTextAreaLabel.HorizontalAlignment = 'right';
            app.InputStateTextAreaLabel.Position = [17 220 63 22];
            app.InputStateTextAreaLabel.Text = 'Input State';

            % Create InputStateTextArea
            app.InputStateTextArea = uitextarea(app.InspectorTab);
            app.InputStateTextArea.Editable = 'off';
            app.InputStateTextArea.Position = [95 164 115 80];

            % Create YourKeyTextAreaLabel
            app.YourKeyTextAreaLabel = uilabel(app.InspectorTab);
            app.YourKeyTextAreaLabel.HorizontalAlignment = 'right';
            app.YourKeyTextAreaLabel.Position = [213 220 53 22];
            app.YourKeyTextAreaLabel.Text = 'Your Key';

            % Create YourKeyTextArea
            app.YourKeyTextArea = uitextarea(app.InspectorTab);
            app.YourKeyTextArea.Editable = 'off';
            app.YourKeyTextArea.Position = [281 164 116 80];

            % Create OutputTextArea_2Label
            app.OutputTextArea_2Label = uilabel(app.InspectorTab);
            app.OutputTextArea_2Label.HorizontalAlignment = 'right';
            app.OutputTextArea_2Label.Position = [422 220 41 22];
            app.OutputTextArea_2Label.Text = 'Output';

            % Create OutputTextArea_2
            app.OutputTextArea_2 = uitextarea(app.InspectorTab);
            app.OutputTextArea_2.Editable = 'off';
            app.OutputTextArea_2.Position = [478 164 117 80];

            % Create EditField_2
            app.EditField_2 = uieditfield(app.InspectorTab, 'text');
            app.EditField_2.Editable = 'off';
            app.EditField_2.Position = [115 314 457 22];
            app.EditField_2.Value = 'Please type 16 byte hex string with your cipher key below and press enter.';

            % Create CipherKeyEditFieldLabel
            app.CipherKeyEditFieldLabel = uilabel(app.InspectorTab);
            app.CipherKeyEditFieldLabel.HorizontalAlignment = 'right';
            app.CipherKeyEditFieldLabel.Position = [68 275 64 22];
            app.CipherKeyEditFieldLabel.Text = 'Cipher Key';

            % Create CipherKeyEditField
            app.CipherKeyEditField = uieditfield(app.InspectorTab, 'text');
            app.CipherKeyEditField.CharacterLimits = [0 32];
            app.CipherKeyEditField.ValueChangedFcn = createCallbackFcn(app, @CipherKeyEditFieldValueChanged, true);
            app.CipherKeyEditField.Position = [147 275 313 22];

            % Create EnterButton_2
            app.EnterButton_2 = uibutton(app.InspectorTab, 'state');
            app.EnterButton_2.ValueChangedFcn = createCallbackFcn(app, @EnterButton_2ValueChanged, true);
            app.EnterButton_2.Text = 'Enter';
            app.EnterButton_2.Position = [459 275 100 23];

            % Create SelectOperationButtonGroup
            app.SelectOperationButtonGroup = uibuttongroup(app.InspectorTab);
            app.SelectOperationButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @SelectOperationButtonGroupSelectionChanged, true);
            app.SelectOperationButtonGroup.Title = 'Select Operation';
            app.SelectOperationButtonGroup.Position = [284 61 123 91];

            % Create EncryptionButton
            app.EncryptionButton = uiradiobutton(app.SelectOperationButtonGroup);
            app.EncryptionButton.Text = 'Encryption';
            app.EncryptionButton.Position = [11 45 79 22];

            % Create DecryptionButton
            app.DecryptionButton = uiradiobutton(app.SelectOperationButtonGroup);
            app.DecryptionButton.Text = 'Decryption';
            app.DecryptionButton.Position = [11 23 79 22];

            % Create JunkButton
            app.JunkButton = uiradiobutton(app.SelectOperationButtonGroup);
            app.JunkButton.Enable = 'off';
            app.JunkButton.Visible = 'off';
            app.JunkButton.Text = 'Junk';
            app.JunkButton.Position = [11 1 65 22];
            app.JunkButton.Value = true;

            % Create OutputinHexEditFieldLabel
            app.OutputinHexEditFieldLabel = uilabel(app.InspectorTab);
            app.OutputinHexEditFieldLabel.HorizontalAlignment = 'right';
            app.OutputinHexEditFieldLabel.Position = [116 34 78 22];
            app.OutputinHexEditFieldLabel.Text = 'Output in Hex';

            % Create OutputinHexEditField
            app.OutputinHexEditField = uieditfield(app.InspectorTab, 'text');
            app.OutputinHexEditField.CharacterLimits = [0 32];
            app.OutputinHexEditField.Editable = 'off';
            app.OutputinHexEditField.Position = [209 34 313 22];

            % Create InstructionsTab
            app.InstructionsTab = uitab(app.TabGroup);
            app.InstructionsTab.Title = 'Instructions';
            app.InstructionsTab.BackgroundColor = [0.0706 0.6196 1];

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.InstructionsTab);
            app.TextArea_2.Editable = 'off';
            app.TextArea_2.FontSize = 14;
            app.TextArea_2.Position = [14 314 659 179];
            app.TextArea_2.Value = {'Below is the set of instructions for the normal operation of the AES Inspector.'; '1. To begin with, please type the input message and a cipher key and press enter buttons.'; '2. Please ensure that the values are in the format of a hexadecimal string. Any other input will not be accepted. '; '3. The initial four bytes correspond to the first column of the input state, followed by the next four for the second column, and so on. The arrangement places the first byte in the first row and first column, the second in the second row and first column, and so forth. Refer to the accompanying image for clarity.'; '4. The hex is value is converted to decimal and shown in the boxes.'; '5. The similar conversion is executed for a cipher key.'; ''};

            % Create Image2
            app.Image2 = uiimage(app.InstructionsTab);
            app.Image2.Position = [-2 193 660 105];
            app.Image2.ImageSource = fullfile(pathToMLAPP, 'Pics', 'Instructions_1.png');

            % Create TextArea_3
            app.TextArea_3 = uitextarea(app.InstructionsTab);
            app.TextArea_3.Editable = 'off';
            app.TextArea_3.FontSize = 14;
            app.TextArea_3.Position = [15 133 181 45];
            app.TextArea_3.Value = {'6. Select the operation.'; ''};

            % Create Image3
            app.Image3 = uiimage(app.InstructionsTab);
            app.Image3.Position = [207 105 100 100];
            app.Image3.ImageSource = fullfile(pathToMLAPP, 'Pics', 'Instructions_2.png');

            % Create TextArea_4
            app.TextArea_4 = uitextarea(app.InstructionsTab);
            app.TextArea_4.Editable = 'off';
            app.TextArea_4.FontSize = 14;
            app.TextArea_4.Position = [14 23 393 84];
            app.TextArea_4.Value = {'7. If all the steps were followed accordingly, the output should be displayed both as a 4x4 decimal matrix and the hexadecimal string.'};

            % Create Image4
            app.Image4 = uiimage(app.InstructionsTab);
            app.Image4.Position = [422 62 137 116];
            app.Image4.ImageSource = fullfile(pathToMLAPP, 'Pics', 'Instructions_3.png');

            % Create Image5
            app.Image5 = uiimage(app.InstructionsTab);
            app.Image5.Position = [407 -12 276 190];
            app.Image5.ImageSource = fullfile(pathToMLAPP, 'Pics', 'Instructions_5.png');

            % Show the figure after all components are created
            app.AESInspectorUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = AES_App_

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.AESInspectorUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.AESInspectorUIFigure)
        end
    end
end