Project.create!([
  {title: "Site Simples", description: "Site simples para demonstração de uma ideia"},
  {title: "Conta de e-mail", description: "Portal com e-mail"},
  {title: "Aparelho de celular", description: "Aparelho smartfone"},
  {title: "Conta bancária", description: "Site de internet banking"}
])
Threat.create!([
  {title: "Ataque de força bruta", category: "s", description: "Realização de um ataque de força bruta a um sistema de autenticação."},
  {title: "Migração de conta", category: "e", description: "A partir de uma determinada conta logada, ser possível migrar para outra conta"},
  {title: "Captura de Sessão", category: "s", description: "A partir da monitoração de trafego, o atacante pode ser capaz de ter acesso a sessão do usuário"},
  {title: "Descoberta de senhas do usuário", category: "i", description: "A partir de consulta ao banco de dados, o atacante pode descobrir a senha de todos os usuários"},
  {title: "Alteração de senha involuntariamente", category: "r", description: "a partir de uma sessão logada, o atacante pode ser capaz de alterar a senha do usuário"}
])
Solution.create!([
  {title: "Resolução de Um Captcha", description: "Após um número finito de tentativas mal sucedidas, o sistema solicitará um captcha para permitir acesso", cons: "Necessita de acesso a dados externos, para obtenção do captcha", usedtimes: nil, threat_id: 1},
  {title: "Temporizador", description: "Após um número finito de tentativas, o sistema irá impedir uma nova tentativa por um tempo determinado", cons: "O usuário legitimo pode ficar sem acesso ao sistema por muito tempo.", usedtimes: nil, threat_id: 1},
  {title: "Bloqueio de conta", description: "Após um número finito de tentativas a conta do usuário pode ser bloqueada", cons: "Se faz necessário uma terceira parte, com autoridade sobre o sistema, para desbloqueio.", usedtimes: nil, threat_id: 1}
])
Requirement.create!([
  {project_id: 1, threat_id: 1, solution_id: nil, riskaccept: true},
  {project_id: 2, threat_id: 1, solution_id: 1, riskaccept: false},
  {project_id: 3, threat_id: 1, solution_id: 2, riskaccept: false},
  {project_id: 4, threat_id: 1, solution_id: 3, riskaccept: false}
])
