Project.create!([
  {title: "Server Host", description: "Server host to support private cloud"},
  {title: "Institutional university website", description: "institutional university website"}
])
Threat.create!([
  {title: "Sniffing", category: "i", description: "With a simple packet sniffer, an attacker can easily read all plaintext traffic. Also, attackers can crack packets encrypted by lightweight hashing algorithms and can decipher the payload that you considered to be safe. The sniffing of packets requires a packet sniffer in the path of the server/client communication.", context: "Sniffing or eavesdropping is the act of monitoring traffic on the network for data such as plaintext passwords or configuration information"},
  {title: "Spoofing", category: "s", description: "Spoofing is a means to hide one's true identity on the network. To create a spoofed identity, an attacker uses a fake source address that does not represent the actual address of the packet. Spoofing may be used to hide the original source of an attack or to work around network access control lists (ACLs) that are in place to limit host access based on source address rules", context: ""},
  {title: "Session Hijacking", category: "r", description: "Also known as man in the middle attacks, session hijacking deceives a server or a client into accepting the upstream host as the actual legitimate host. Instead the upstream host is an attacker's host that is manipulating the network so the attacker's host appears to be the desired destination.", context: "Network"},
  {title: "Denial of Service", category: "d", description: "Denial of service denies legitimate users access to a server or services. The SYN flood attack is a common example of a network level denial of service attack. It is easy to launch and difficult to track. The aim of the attack is to send more requests to a server than it can handle. The attack exploits a potential vulnerability in the TCP/IP connection establishment mechanism and floods the server's pending connection queue.", context: "Network"},
  {title: "Footprinting", category: "i", description: "Examples of footprinting are port scans, ping sweeps, and NetBIOS enumeration that can be used by attackers to glean valuable system-level information to help prepare for more significant attacks. The type of information potentially revealed by footprinting includes account details, operating system and other software versions, server names, and database schema details.", context: ""}
])

Risk.create!([
  {project_id: 1, threat_id: 3, riskaccept: nil, probability: "7.0", impact: "8.0", exposure: "4.0"},
  {project_id: 1, threat_id: 5, riskaccept: nil, probability: "5.0", impact: "3.0", exposure: "2.0"}
])

Mitigation.create!([
  {title: "Physical Security", description: "Use strong physical security and proper segmenting of the network. This is the first step in preventing traffic from being collected locally.", consequences: "", usedtimes: nil, threat_id: 1, reference: nil},
  {title: "Encrypt communication", description: "Encrypt communication fully, including authentication credentials. This prevents sniffed packets from being usable to an attacker. SSL and IPSec (Internet Protocol Security) are examples of encryption solutions.", consequences: "", usedtimes: nil, threat_id: 1, reference: nil},
  {title: "Filter Incoming", description: "Filter incoming packets that appear to come from an internal IP address at your perimeter.", consequences: "", usedtimes: nil, threat_id: 2, reference: nil},
  {title: "Filter outgoing", description: "Filter outgoing packets that appear to originate from an invalid local IP address.", consequences: "", usedtimes: nil, threat_id: 2, reference: nil},
  {title: "Encrypt session", description: "Use encrypted session negotiation.", consequences: "increases the overhead communcation", usedtimes: nil, threat_id: 3, reference: "https://msdn.microsoft.com/pt-br/library/aa302418.aspx#c02618429_006"},
  {title: "Encrypt channels", description: "Use encrypted communication channels.\r\n", consequences: "", usedtimes: nil, threat_id: 3, reference: nil},
  {title: "Update system", description: "Apply the latest service packs.", consequences: "", usedtimes: nil, threat_id: 4, reference: nil},
  {title: "Configure TCP/IP stack", description: "Harden the TCP/IP stack by applying the appropriate registry settings to increase the size of the TCP connection queue, decrease the connection establishment period, and employ dynamic backlog mechanisms to ensure that the connection queue is never exhausted.", consequences: "", usedtimes: nil, threat_id: 4, reference: nil},
  {title: "Use IDS", description: "Use a network Intrusion Detection System (IDS) because these can automatically detect and respond to SYN attacks.", consequences: "", usedtimes: nil, threat_id: 4, reference: nil}
])
Risk::HABTM_Mitigations.create!([
  {risk_id: 1, mitigation_id: 5},
  {risk_id: 1, mitigation_id: 6}
])