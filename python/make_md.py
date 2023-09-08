import re

# Read the .nmap file
with open('/home/parallels/Documents/OSCP_LAB/Access/nmap/full.nmap', 'r') as nmap_file:
    nmap_data = nmap_file.read()

# Extract the machine name and IP address
machine_name = re.search(r'Nmap scan report for (.+)', nmap_data).group(1)
ip_address = re.search(r'(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})', nmap_data).group(1)


# Extract the port information from the .nmap file
port_info = re.findall(r'(\d+\/tcp)\s+(\w+)\s+(\w+)', nmap_data)

# Create the .md file
file_name = f'/home/parallels/Documents/TIL/OSCP/HTB/{machine_name}.md'
with open(file_name, 'w') as md_file:
    # Write the machine name and IP address
    md_file.write('# {} - {}\n\n'.format(machine_name, ip_address))

    # Write the Nmap result at the top of the file
    md_file.write('```\n')
    md_file.write(nmap_data)
    md_file.write('```')
    md_file.write('\n\n')

    # Write the port information with headings
    for port in port_info:
        md_file.write('### Port {}\n'.format(port[0]))
        md_file.write('Service: {}\n'.format(port[1]))
        md_file.write('State: {}\n\n'.format(port[2]))

# Todo: タイトルを自動作成する
# Todo: タイトルにIPアドレスをつける