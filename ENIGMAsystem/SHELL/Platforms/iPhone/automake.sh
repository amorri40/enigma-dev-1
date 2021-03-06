# Makefile generator instantiated from /ENIGMAsystem/SHELL/Developer/.

echo "#Awesome Makefile generated by local copy of ENIGMAsystem/Developer/automake.sh" > Makefile
echo "" >> Makefile;

for file in *.cpp ;
  do
  {
    printf "\$(OBJECTS)/${file%.cpp}.o: $file" >> Makefile;
    for i in `c_incl $file | gawk '/\/usr\/include/ { next } { print } '`;
    do
      printf " $i" >> Makefile;
    done;
    echo "" >> Makefile;
    
    echo "	\$(CXX) -c $file		-o \$(OBJECTS)/${file%.cpp}.o \$(GFLAGS) \$(ECPPFLAGS)"  >> Makefile;
  };
  done;

for file in *.m ;
  do
  {
    printf "\$(OBJECTS)/${file%.m}.o: $file" >> Makefile;
    for i in `c_incl $file | gawk '/\/usr\/include/ { next } { print } '`;
    do
      printf " $i" >> Makefile;
    done;
    echo "" >> Makefile;
    
    echo "	\$(CXX) -c $file		-o \$(OBJECTS)/${file%.m}.o \$(GFLAGS) \$(ECPPFLAGS)"  >> Makefile;
  };
  done;

echo "" >> Makefile;

# Create the eobjs folder
echo "\$(OBJECTS):" >> Makefile;
echo "	-mkdir -p \$(OBJECTS) || mkdir \"\$(OBJECTS)\"" >> Makefile;
echo "" >> Makefile;

# Generate target
printf "this: \$(OBJECTS) " >> Makefile;
for file in *.cpp ;
  do printf "\$(OBJECTS)/${file%.cpp}.o " >> Makefile; 
  done;
for file in *.m ;
  do printf "\$(OBJECTS)/${file%.m}.o " >> Makefile; 
  done;
echo "" >> Makefile;

echo "" >> Makefile;
echo "clean:" >> Makefile;
echo "	-rm .eobjs/*/*/*/*" >> Makefile;

