#!/usr/bin/bash
#Get current date and time
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
filename="Centos_network_script_${timestamp}.txt"

#A function to collect network info.

network()  { 
	echo "Centos Network information - ${timestamp}"} > ${filename}
	echo "-----------------------------------------" >> ${filename}


# Display IP address
echo "IP address:" >> ${filename}
ip a | grep "inet" | awk '{print $2}' >> ${filename}
echo >> ${filename}


# Display DNS Info
echo "DNS server:" >> ${filename}
cat /etc/resolv.conf | grep "nameserver" >> ${filename}
echo >> ${filename}



#Show Open ports
echo "Open Ports on the server:" >> ${filename}
sudo netstat -tuln | grep LISTEN >> ${filename}
echo >> ${filename}




#Display route info
echo "Routing Table:" >> ${filename}
ip route >> ${filename}
echo >> ${filename}



#Display the active interfaces
echo "Network Interfaces: " >> ${filename}
ip link show >> ${filename}
echo >> ${filename}

echo "Network information file created and saved to ${filename}"

}

#Run the function (network) to gather the network information above

network

#Display the output on the screen
cat ${filename}
