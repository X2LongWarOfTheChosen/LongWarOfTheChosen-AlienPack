//--------------------------------------------------------------------------------------- 
//  FILE:    X2Effect_Infighter
//  AUTHOR:  John Lumpkin (Long War Studios)
//  PURPOSE: Sets up dodge bonuses for Infighter (Soldier gains +25 dodge against attacks within four tiles (including melee)
//---------------------------------------------------------------------------------------
class X2Effect_Infighter_AP extends X2Effect_Persistent config (LW_AlienPack);

var config int INFIGHTER_DODGE_BONUS;
var config int INFIGHTER_MAX_TILES;

function GetToHitAsTargetModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{

    local ShotModifierInfo				ShotInfo;
	local int							Tiles;

	Tiles = Attacker.TileDistanceBetween(Target);       
	if (Tiles <= default.INFIGHTER_MAX_TILES)
	{
		ShotInfo.ModType = eHit_Graze;
		ShotInfo.Reason = FriendlyName;
		ShotInfo.Value = default.INFIGHTER_DODGE_BONUS;
		ShotModifiers.AddItem(ShotInfo);
	}
}

defaultproperties
{
    DuplicateResponse=eDupe_Ignore
    EffectName="Infighter"
}
