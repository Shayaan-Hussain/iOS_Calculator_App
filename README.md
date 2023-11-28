# Calculator for iOS

This is my first iOS application developed using Swift Programming and Storyboard for UI.<br/><br/>
I previously developed a to-do list application and a dice roll application while watching code-along videos where-as this one was developed by me from scratch.<br/>

## Components used in UI:
<ul>
  <li>Label</li>
  <li>Buttons</li>
  <li>Views</li>
  <li>Stack Views</li>
  <li>Constraints</li>
</ul>

## Back-end Programming:
<ul>
  <li>The number buttons are configured to append the specified number to the label variable.</li>
  <li>The operators (+, -, x, ÷) are configured such that if the last element is another operator, it replaces the previous operator, otherwise appends the operator to label variable.</li>
  <li>The AC (All Clear) button is to clear the expression in label.</li>
  <li>Evaluation is done using postfix evaluation algorithm after the infix to postfix conversion. Both the algorithms are implemented using stacks.</li>
  <li>The equals-to button (=) evaluates the expression and replaces the expression with the result. It does nothing if the expression is invalid.</li>
  <li>The percentage button (%) evaluates the expression on screen (let x) and divides the expression by 100, which if multiplied by y can calculate x percent of y.</li>
</ul>

## Execution
#### ***Requirements***
<ul>
  <li>MacOS</li>
  <li>XCode</li>
  <li>iPhone or iPhone Simulator</li>
</ul>

#### ***Procedure***
<ol>
  <li>Clone the repository.</li>
  <li>Select the suitable output device.</li>
  <li>Initiate build.</li>
  <li>Once the build is completed, the app can run on the local device.</li>
</ol>
