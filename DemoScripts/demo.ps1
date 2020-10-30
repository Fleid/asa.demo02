#gh auth login

## Demo 1 - Version Control

$reposRootPath = "C:\users\fleide\repos"
cd $reposRootPath

$repoName = "asa.demo02"
gh repo create $repoName --public -y
cd $repoName

"# Azure Stream Analytics - unit testing" | Out-file README.md
git add .
git commit -m "first commit"
git push -u origin master
code

## Demo 3 -- Unit Testing ASA

$projectPath = "$reposRootPath\$repoName\ASATest1\asaproj.json"
$testPath = "$reposRootPath\$repoName\ASATest1.Tests\testConfig.json"

azure-streamanalytics-cicd addtestcase `
    -project $projectPath `
    -testConfigPath $testPath

$testOutputPath = "$reposRootPath\$repoName\ASATest1.Tests\testRuns\" + (Get-Date -Format "yyyyMMddHHmmss")

azure-streamanalytics-cicd test `
    -project $projectPath `
    -testConfigPath $testPath `
    -outputPath $testOutputPath