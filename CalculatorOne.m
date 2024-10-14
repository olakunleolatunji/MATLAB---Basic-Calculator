classdef CalculatorOne < matlab.apps.AppBase
    %CALCULATORONE event

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        Calc10TextArea       matlab.ui.control.TextArea
        Calc10TextAreaLabel  matlab.ui.control.Label
        Button_Equal         matlab.ui.control.Button
        Button_Divide        matlab.ui.control.Button
        Button_Multiply      matlab.ui.control.Button
        Button_Subtract      matlab.ui.control.Button
        Button_Add           matlab.ui.control.Button
        CLRButton            matlab.ui.control.Button
        DELButton            matlab.ui.control.Button
        Button_0             matlab.ui.control.Button
        Button_9             matlab.ui.control.Button
        Button_8             matlab.ui.control.Button
        Button_7             matlab.ui.control.Button
        Button_6             matlab.ui.control.Button
        Button_5             matlab.ui.control.Button
        Button_4             matlab.ui.control.Button
        Button_3             matlab.ui.control.Button
        Button_2             matlab.ui.control.Button
        Button_1             matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button_0, Button_1, Button_2, Button_3, 
        % ...and 6 other components
        function numberPressed(app, event)
            app.Calc10TextArea.Value = [app.Calc10TextArea.Value{1} event.Source.Text];
        end

        % Button pushed function: CLRButton
        function clearButton(app, event)
            app.Calc10TextArea.Value = '';
        end

        % Button pushed function: DELButton
        function deleteButton(app, event)
            currentText = app.Calc10TextArea.Value;
            currentText = char(currentText);
            if ~isempty(currentText)
                newText = currentText(1:end-1);
                app.Calc10TextArea.Value = newText;
            end
        end

        % Button pushed function: Button_Add, Button_Divide, 
        % ...and 2 other components
        function operationButton(app, event)
            app.Calc10TextArea.Value = [app.Calc10TextArea.Value{1} event.Source.Text];
        end

        % Button pushed function: Button_Equal
        function resultButton(app, event)
            app.Calc10TextArea.Value = [app.Calc10TextArea.Value{1} ' ' event.Source.Text ' ' num2str(eval(app.Calc10TextArea.Value{1}))];
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create Button_1
            app.Button_1 = uibutton(app.UIFigure, 'push');
            app.Button_1.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_1.Position = [150 213 26 23];
            app.Button_1.Text = '7';

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_2.Position = [185 213 26 23];
            app.Button_2.Text = '8';

            % Create Button_3
            app.Button_3 = uibutton(app.UIFigure, 'push');
            app.Button_3.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_3.Position = [225 213 26 23];
            app.Button_3.Text = '9';

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'push');
            app.Button_4.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_4.Position = [150 179 26 23];
            app.Button_4.Text = '4';

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_5.Position = [185 179 26 23];
            app.Button_5.Text = '5';

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_6.Position = [225 179 26 23];
            app.Button_6.Text = '6';

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_7.Position = [150 141 26 23];
            app.Button_7.Text = '1';

            % Create Button_8
            app.Button_8 = uibutton(app.UIFigure, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_8.Position = [185 141 26 23];
            app.Button_8.Text = '2';

            % Create Button_9
            app.Button_9 = uibutton(app.UIFigure, 'push');
            app.Button_9.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_9.Position = [225 141 26 23];
            app.Button_9.Text = '3';

            % Create Button_0
            app.Button_0 = uibutton(app.UIFigure, 'push');
            app.Button_0.ButtonPushedFcn = createCallbackFcn(app, @numberPressed, true);
            app.Button_0.Position = [185 105 26 23];
            app.Button_0.Text = '0';

            % Create DELButton
            app.DELButton = uibutton(app.UIFigure, 'push');
            app.DELButton.ButtonPushedFcn = createCallbackFcn(app, @deleteButton, true);
            app.DELButton.Position = [281 213 54 23];
            app.DELButton.Text = 'DEL';

            % Create CLRButton
            app.CLRButton = uibutton(app.UIFigure, 'push');
            app.CLRButton.ButtonPushedFcn = createCallbackFcn(app, @clearButton, true);
            app.CLRButton.Position = [364 213 54 23];
            app.CLRButton.Text = 'CLR';

            % Create Button_Add
            app.Button_Add = uibutton(app.UIFigure, 'push');
            app.Button_Add.ButtonPushedFcn = createCallbackFcn(app, @operationButton, true);
            app.Button_Add.Position = [281 179 54 23];
            app.Button_Add.Text = '+';

            % Create Button_Subtract
            app.Button_Subtract = uibutton(app.UIFigure, 'push');
            app.Button_Subtract.ButtonPushedFcn = createCallbackFcn(app, @operationButton, true);
            app.Button_Subtract.Position = [364 179 54 23];
            app.Button_Subtract.Text = '-';

            % Create Button_Multiply
            app.Button_Multiply = uibutton(app.UIFigure, 'push');
            app.Button_Multiply.ButtonPushedFcn = createCallbackFcn(app, @operationButton, true);
            app.Button_Multiply.Position = [281 141 54 23];
            app.Button_Multiply.Text = '*';

            % Create Button_Divide
            app.Button_Divide = uibutton(app.UIFigure, 'push');
            app.Button_Divide.ButtonPushedFcn = createCallbackFcn(app, @operationButton, true);
            app.Button_Divide.Position = [364 141 54 23];
            app.Button_Divide.Text = '/';

            % Create Button_Equal
            app.Button_Equal = uibutton(app.UIFigure, 'push');
            app.Button_Equal.ButtonPushedFcn = createCallbackFcn(app, @resultButton, true);
            app.Button_Equal.Position = [319 105 54 23];
            app.Button_Equal.Text = '=';

            % Create Calc10TextAreaLabel
            app.Calc10TextAreaLabel = uilabel(app.UIFigure);
            app.Calc10TextAreaLabel.HorizontalAlignment = 'right';
            app.Calc10TextAreaLabel.Position = [149 308 49 22];
            app.Calc10TextAreaLabel.Text = 'Calc 1.0';

            % Create Calc10TextArea
            app.Calc10TextArea = uitextarea(app.UIFigure);
            app.Calc10TextArea.Position = [149 249 269 60];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = CalculatorOne

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end