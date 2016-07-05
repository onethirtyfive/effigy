require 'effigy/wire'

module Effigy
  module Lookup
    # Aliases
    W    = Wire
    WS2  = Wire::S2
    WEDC = Wire::EDemoCommands
    WNET = Wire::NET_Messages
    WSVC = Wire::S2::SVC_Messages
    WEBM = Wire::S2::EBaseUserMessages
    EBGE = Wire::S2::EBaseGameEvents
    ETEP = Wire::S2::ETEProtobufIds
    EDUM = Wire::S2::EDotaUserMessages

    DEMO_PACKETS =
      [
        [WEDC::DEM_CLASSINFO,           W::CDemoClassInfo          ],
        [WEDC::DEM_CONSOLECMD,          W::CDemoConsoleCmd         ],
        [WEDC::DEM_CUSTOMDATA,          W::CDemoCustomData         ],
        [WEDC::DEM_CUSTOMDATACALLBACKS, W::CDemoCustomDataCallbacks],
        [WEDC::DEM_FILEHEADER,          W::CDemoFileHeader         ],
        [WEDC::DEM_FILEINFO,            W::CDemoFileInfo           ],
        [WEDC::DEM_FULLPACKET,          W::CDemoFullPacket         ],
        [WEDC::DEM_PACKET,              W::CDemoPacket             ],
        [WEDC::DEM_SENDTABLES,          W::CDemoSendTables         ],
        [WEDC::DEM_SIGNONPACKET,        W::CDemoPacket             ],
        [WEDC::DEM_STRINGTABLES,        W::CDemoStringTables       ],
        [WEDC::DEM_STOP,                W::CDemoStop               ],
        [WEDC::DEM_SYNCTICK,            W::CDemoSyncTick           ],
        [WEDC::DEM_USERCMD,             W::CDemoUserCmd            ],
        [WEDC::DEM_SAVEGAME,            W::CDemoSaveGame           ],
        [WEDC::DEM_SPAWNGROUPS,         W::CDemoSpawnGroups        ]
      ].inject({}) do |acc, (enum, klass)|
        acc[enum.to_i] = klass
        acc
      end.freeze

    EMBEDDED_PACKETS =
      [
        # Note: Omitted message types haven't been encountered in replays.

        #######################################################################
        # NET messages
        #######################################################################
        [WNET::NET_TICK,                 W::CNETMsg_Tick                ],#   4
        [WNET::NET_SETCONVAR,            W::CNETMsg_SetConVar           ],#   6
        [WNET::NET_SIGNONSTATE,          W::CNETMsg_SignonState         ],#   7
        [WNET::NET_SPAWNGROUP_LOAD,      W::CNETMsg_SpawnGroup_Load     ],#   8
        [
          WNET::NET_SPAWNGROUP_MANIFESTUPDATE,
          W::CNETMsg_SpawnGroup_ManifestUpdate
        ], # 9
        [
          WNET::NET_SPAWNGROUP_SETCREATIONTICK,
          W::CNETMsg_SpawnGroup_SetCreationTick
        ], # 11
        [
          WNET::NET_SPAWNGROUP_UNLOAD,
          W::CNETMsg_SpawnGroup_SetCreationTick
        ], # 12

        #######################################################################
        # Source 2-flavored SVC messages
        #######################################################################
        [WSVC::SVC_SERVERINFO,           W::CSVCMsg_ServerInfo          ],#  40
        [
          WSVC::SVC_FLATTENEDSERIALIZER,
          WS2::CSVCMsg_FlattenedSerializer
        ], # 41
        [WSVC::SVC_CLASSINFO,            W::CSVCMsg_ClassInfo           ],#  42
        [WSVC::SVC_CREATESTRINGTABLE,    WS2::CSVCMsg_CreateStringTable ],#  44
        [WSVC::SVC_UPDATESTRINGTABLE,    W::CSVCMsg_UpdateStringTable   ],#  45
        [WSVC::SVC_VOICEINIT,            W::CSVCMsg_VoiceInit           ],#  46
        [WSVC::SVC_VOICEDATA,            WS2::CSVCMsg_VoiceData         ],#  47
        [WSVC::SVC_PRINT,                W::CSVCMsg_Print               ],#  48
        [WSVC::SVC_SETVIEW,              W::CSVCMsg_SetView             ],#  50
        [
          WSVC::SVC_CLEARALLSTRINGTABLES,
          WS2::CSVCMsg_ClearAllStringTables
        ], # 51
        [WSVC::SVC_PACKETENTITIES,       W::CSVCMsg_PacketEntities      ],#  55
        [WSVC::SVC_PEERLIST,             WS2::CSVCMsg_PeerList          ],#  60
        [WSVC::SVC_HLTVSTATUS,           WS2::CSVCMsg_HLTVStatus        ],#  62
        [WSVC::SVC_FULLFRAMESPLIT,       W::CSVCMsg_FullFrameSplit      ],#  70

        #######################################################################
        # Source 2-flavored UM messages
        #######################################################################
        [WEBM::UM_RESETHUD,              WS2::CUserMessageResetHUD      ],# 115
        [WEBM::UM_SAYTEXT2,              WS2::CUserMessageSayText2      ],# 118
        [WEBM::UM_TEXTMSG,               WS2::CUserMessageTextMsg       ],# 124
        [WEBM::UM_VOICEMASK,             WS2::CUserMessageVoiceMask     ],# 128
        [WEBM::UM_SENDAUDIO,             WS2::CUserMessageSendAudio     ],# 130

        #######################################################################
        # Source 2-flavored GE messages
        #######################################################################
        [
          EBGE::GE_SOURCE1LEGACYGAMEEVENTLIST,
          W::CSVCMsg_GameEventList
        ], # 205
        [
          EBGE::GE_SOURCE1LEGACYGAMEEVENT,
          W::CSVCMsg_GameEvent
        ], # 207
        [EBGE::GE_SOSSTARTSOUNDEVENT,    WS2::CMsgSosStartSoundEvent    ],# 208
        [EBGE::GE_SOSSTOPSOUNDEVENT,     WS2::CMsgSosStopSoundEvent     ],# 209
        [
          EBGE::GE_SOSSETSOUNDEVENTPARAMS,
          WS2::CMsgSosSetSoundEventParams
        ], # 210
        [
          EBGE::GE_SOSSTOPSOUNDEVENTHASH,
          WS2::CMsgSosStopSoundEventHash
        ], # 212

        #######################################################################
        # Source 2-flavored GE messages
        #######################################################################
        [ETEP::TE_EFFECTDISPATCHID,      WS2::CMsgTEEffectDispatch      ],# 400
        
        #######################################################################
        # Source 2-flavored Dota UM messages
        #######################################################################
        [EDUM::DOTA_UM_CHATEVENT,        W::CDOTAUserMsg_ChatEvent      ],# 466
        [
          EDUM::DOTA_UM_CREATELINEARPROJECTILE,
          W::CDOTAUserMsg_CreateLinearProjectile
        ], # 471
        [
          EDUM::DOTA_UM_DESTROYLINEARPROJECTILE,
          W::CDOTAUserMsg_DestroyLinearProjectile
        ], # 472
        [
          EDUM::DOTA_UM_DODGETRACKINGPROJECTILES,
          W::CDOTAUserMsg_DodgeTrackingProjectiles
        ], # 473
        [
          EDUM::DOTA_UM_GLOBALLIGHTCOLOR,
          W::CDOTAUserMsg_GlobalLightColor
        ], # 474
        [
          EDUM::DOTA_UM_GLOBALLIGHTDIRECTION,
          W::CDOTAUserMsg_GlobalLightDirection
        ], # 475
        [EDUM::DOTA_UM_LOCATIONPING,     W::CDOTAUserMsg_LocationPing   ],# 477
        [EDUM::DOTA_UM_MAPLINE,          W::CDOTAUserMsg_MapLine        ],# 478
        [EDUM::DOTA_UM_MINIKILLCAMINFO,  W::CDOTAUserMsg_MiniKillCamInfo],# 479
        [EDUM::DOTA_UM_MINIMAPEVENT,     W::CDOTAUserMsg_MinimapEvent   ],# 481
        [
          EDUM::DOTA_UM_NEVERMOREREQUIEM,
          W::CDOTAUserMsg_NevermoreRequiem
        ], # 482
        [EDUM::DOTA_UM_OVERHEADEVENT,    W::CDOTAUserMsg_OverheadEvent  ],# 483
        [EDUM::DOTA_UM_SHAREDCOOLDOWN,   W::CDOTAUserMsg_SharedCooldown ],# 485
        [
          EDUM::DOTA_UM_SPECTATORPLAYERCLICK,
          W::CDOTAUserMsg_SpectatorPlayerClick
        ], # 486
        [EDUM::DOTA_UM_UNITEVENT,        W::CDOTAUserMsg_UnitEvent      ],# 488
        [EDUM::DOTA_UM_PARTICLEMANAGER,  W::CDOTAUserMsg_ParticleManager],# 489
        [EDUM::DOTA_UM_BOTCHAT,          W::CDOTAUserMsg_BotChat        ],# 490
        [EDUM::DOTA_UM_HUDERROR,         W::CDOTAUserMsg_HudError       ],# 491
        [EDUM::DOTA_UM_ITEMPURCHASED,    W::CDOTAUserMsg_ItemPurchased  ],# 492
        [EDUM::DOTA_UM_WORLDLINE,        W::CDOTAUserMsg_WorldLine      ],# 497
        [EDUM::DOTA_UM_CHATWHEEL,        W::CDOTAUserMsg_ChatWheel      ],# 501
        [
          EDUM::DOTA_UM_GAMERULESSTATECHANGED,
          W::CDOTAUserMsg_GamerulesStateChanged
        ], # 506
        [EDUM::DOTA_UM_SENDSTATPOPUP,    W::CDOTAUserMsg_SendStatPopup  ],# 510
        [
          EDUM::DOTA_UM_SENDROSHANPOPUP,
          W::CDOTAUserMsg_SendRoshanPopup
        ], # 512
        [EDUM::DOTA_UM_TE_PROJECTILE,    W::CDOTAUserMsg_TE_Projectile  ],# 518
        [
          EDUM::DOTA_UM_TE_PROJECTILELOC,
          W::CDOTAUserMsg_TE_ProjectileLoc
        ], # 519
        [
          EDUM::DOTA_UM_TE_DOTABLOODIMPACT,
          W::CDOTAUserMsg_TE_DotaBloodImpact
        ], # 520
        [
          EDUM::DOTA_UM_TE_UNITANIMATION,
          W::CDOTAUserMsg_TE_UnitAnimation
        ], # 521
        [
          EDUM::DOTA_UM_TE_UNITANIMATIONEND,
          W::CDOTAUserMsg_TE_UnitAnimationEnd
        ], # 522
        [EDUM::DOTA_UM_ABILITYSTEAL,     W::CDOTAUserMsg_AbilitySteal   ],# 532
        [
          EDUM::DOTA_UM_COURIERKILLEDALERT,
          W::CDOTAUserMsg_CourierKilledAlert
        ], # 533
        [EDUM::DOTA_UM_ENEMYITEMALERT,   W::CDOTAUserMsg_EnemyItemAlert ],# 534
        [
          EDUM::DOTA_UM_PREDICTIONRESULT,
          W::CDOTAUserMsg_PredictionResult
        ], # 542
        [EDUM::DOTA_UM_HPMANAALERT,      W::CDOTAUserMsg_HPManaAlert    ],# 544
        [
          EDUM::DOTA_UM_SPECTATORPLAYERUNITORDERS,
          W::CDOTAUserMsg_SpectatorPlayerUnitOrders
        ], # 547
        [
          EDUM::DOTA_UM_PROJECTIONABILITY,
          W::CDOTAUserMsg_ProjectionAbility
        ], # 552
        [EDUM::DOTA_UM_PROJECTIONEVENT,  W::CDOTAUserMsg_ProjectionEvent],# 553
        [
          EDUM::DOTA_UM_COMBATLOGDATAHLTV,
          W::CMsgDOTACombatLogEntry
        ], # 554
        [EDUM::DOTA_UM_MATCHMETADATA,    WS2::CDOTAMatchMetadataFile    ],# 557
        [EDUM::DOTA_UM_MATCHDETAILS,     W::S2::CMsgDOTAMatch           ],# 558
      ].inject({}) do |acc, (enum, klass)|
        acc[enum.to_i] = klass
        acc
      end.freeze
  end
end
