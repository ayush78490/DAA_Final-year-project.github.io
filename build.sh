#!/bin/sh

# Step 1: Create necessary build directories
mkdir -p build/bin || exit 1

# Step 2: Copy dependencies
cp -r lib ./build || exit 1
cp -r res ./build || exit 1

# Step 3: Compile Java sources
echo "Compiling App.java..."
javac -cp ./src:./lib/json-simple-1.1.1.jar src/App.java -d build/bin || exit 1

echo "Compiling controllers..."
javac -cp ./src:./lib/json-simple-1.1.1.jar src/app/controllers/*.java -d build/bin || exit 1

# Step 4: Create the JAR
echo "Creating boom.jar..."
jar -cvfm build/boom.jar .manifest -C build/bin . || exit 1

echo " Build complete! Run the project using:"
echo "   java -jar build/boom.jar"

